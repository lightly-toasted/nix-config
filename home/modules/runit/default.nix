{ config, lib, ... }:

{
  imports = (
    let
      servicesPath = ./services;
      serviceModules = builtins.attrNames (builtins.readDir (servicesPath));
    in
      map (module: servicesPath + "/${module}") serviceModules
  );

  options.runit = {
    services = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule ({ name, ... }: {
        options = {
          script = lib.mkOption {
            type = lib.types.str;
            description = "Shell commands executed as the service's main process";
          };
          log.enable = lib.mkEnableOption "Enable logging";
          environment = lib.mkOption {
            type = lib.types.attrsOf lib.types.str;
            default = {};
            description = "Environment variables passed to the service's processes";
          };
          environmentFile = lib.mkOption {
            type = lib.types.nullOr lib.types.path;
            default = null;
            description = "Environment file passed to the service";
          };
        };
      }));
    };
    default = {};
    description = "User-level runit services under ~/runit/services/";
  };

  config = {
    home.file = lib.mkMerge (
      lib.mapAttrsToList (serviceName: sCfg:
        let
          envExports = lib.concatStringsSep "\n" (
            lib.mapAttrsToList (k: v: "export ${k}='${v}'") sCfg.environment
          );
          envFile = lib.mkIf (sCfg.environmentFile != null) {
            "runit/services/${serviceName}/.env" = {
              source = sCfg.environmentFile;
            };
          };
          envFileSetup = if sCfg.environmentFile != null then ''
            set -a
            source .env
            set +a
          '' else "";
        in
        lib.mkMerge [
          {
            # run script
            "runit/services/${serviceName}/run" = {
              text = ''
                #!/usr/bin/env bash
                ${envExports}
                ${envFileSetup}
                ${sCfg.script}
              '';
              executable = true;
            };

            # logging
            "runit/services/${serviceName}/log/run" = lib.mkIf sCfg.log.enable {
              text = ''
                #!/bin/sh
                exec svlogd -t ./main
              '';
              executable = true;
            };
          }
          envFile
        ]
      ) config.runit.services
    );
  };
}

