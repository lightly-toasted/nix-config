{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      inputs.nix-flatpak.nixosModules.nix-flatpak
      inputs.sops-nix.nixosModules.sops
      ./hardware-configuration.nix

      ./modules/boot.nix
      ./modules/network.nix
      ./modules/time.nix
      ./modules/users.nix
      ./modules/packages.nix
      ./modules/services.nix
      ./modules/hardware.nix
      ./modules/environment.nix
      ./modules/programs.nix
      ./modules/sops.nix
    ];

  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
