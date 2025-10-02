{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.nixcord.homeModules.nixcord
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    inputs.sops-nix.homeManagerModules.sops
  ] ++ (
    let
      modulesPath = ../modules;
      cliModules = builtins.attrNames (builtins.readDir ( modulesPath + "/cli" ));
      graphicalModules = builtins.attrNames (builtins.readDir ( modulesPath + "/graphical" ));
    in
      map (module: modulesPath + "/cli/${module}") cliModules
      ++ map (module: modulesPath + "/graphical/${module}") graphicalModules
  );

  home = {
    username = "toast";
    homeDirectory = "/home/toast";
    stateVersion = "24.11";
  };

  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = "sd-switch";
}
