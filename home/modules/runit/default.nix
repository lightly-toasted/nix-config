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
        };
      }));
    };
    default = {};
    description = "User-level runit services under ~/runit/services/";
  };

  config = {
    home.file = lib.mkMerge (
      lib.mapAttrsToList (serviceName: sCfg:
        {
          # run script
          "runit/services/${serviceName}/run" = {
            text = sCfg.script;
            executable = true;
          };
          
          # logging
          "runit/services/${serviceName}/log/run" = lib.mkIf sCfg.log.enable {
            text = ''
              #!/bin/sh
              exec svlogd -t ./main
            '';
          };
        }
      ) config.runit.services
    );
  };
}

