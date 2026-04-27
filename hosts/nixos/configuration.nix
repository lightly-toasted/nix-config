{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      inputs.nix-flatpak.nixosModules.nix-flatpak
      inputs.sops-nix.nixosModules.sops
      inputs.lanzaboote.nixosModules.lanzaboote
      ./hardware-configuration.nix
    ] ++ [
      ../../modules/core/packages.nix
      ../../modules/core/time.nix
      ../../modules/core/sops.nix
      ../../modules/graphical/environment.nix
      ../../modules/graphical/greetd.nix
      ../../modules/graphical/hyprland.nix
      ../../modules/graphical/steam.nix
      ../../modules/graphical/thunar.nix
      ../../modules/graphical/xfconf.nix
      ../../modules/graphical/xserver.nix
      ../../modules/graphical/flatpak.nix
      ../../modules/graphical/ratbagd.nix
      ../../modules/programs/nh.nix
      ../../modules/programs/nix-ld.nix
      ../../modules/programs/ssh.nix
      ../../modules/programs/ydotool.nix
      ../../modules/programs/zsh.nix
      ../../modules/services/tailscale.nix
      ../../modules/services/udisks2.nix
      ../../modules/services/zerotierone.nix
      ./modules/boot.nix
      ./modules/network.nix
      ./modules/users.nix
      ./modules/hardware.nix
      ./modules/services/restic.nix
    ];

  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
