{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nixcord.homeModules.nixcord
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    inputs.sops-nix.homeManagerModules.sops
  ] ++ (
    let
      modulesPath = ../modules;
      cliModules = builtins.attrNames (builtins.readDir (modulesPath + "/cli/"));
    in
      map (module: modulesPath + "/cli/${module}") cliModules
  );

  home = {
    username = "toast";
    homeDirectory = "/home/toast";
    stateVersion = "24.11";
  };

  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = "sd-switch";
}
