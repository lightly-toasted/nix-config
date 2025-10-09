{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.sops-nix.homeManagerModules.sops
  ] ++ (
    let
      modulesPath = ../modules;
      cliModules = builtins.attrNames (builtins.readDir (modulesPath + "/cli/"));
    in
      map (module: modulesPath + "/cli/${module}") cliModules
  );

  home = {
    username = "android";
    homeDirectory = "/home/android";
    stateVersion = "24.11";
  };

  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = "sd-switch";
}
