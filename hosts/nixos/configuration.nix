{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      inputs.nix-flatpak.nixosModules.nix-flatpak
      inputs.sops-nix.nixosModules.sops
      ./hardware-configuration.nix
    ] ++ (
      let
        modulesPath = ./modules;
        moduleFiles = builtins.attrNames (builtins.readDir modulesPath);
      in
        map (module: modulesPath + ("/" + module)) moduleFiles
    );

  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
