{ inputs, ... }:

{
  imports =
    [ 
      inputs.nix-flatpak.nixosModules.nix-flatpak
      inputs.sops-nix.nixosModules.sops
      inputs.lanzaboote.nixosModules.lanzaboote
      ./hardware-configuration.nix
    ] ++ [
      ../../modules/common
      ../../modules/programs/environment.nix
      ../../modules/programs/greetd.nix
      ../../modules/programs/hyprland.nix
      ../../modules/programs/steam.nix
      ../../modules/programs/thunar.nix
      ../../modules/programs/xfconf.nix
      ../../modules/programs/xserver.nix
      ../../modules/programs/flatpak.nix
      ../../modules/programs/ratbagd.nix
      ../../modules/programs/pipewire.nix
      ../../modules/programs/nh.nix
      ../../modules/programs/nix-ld.nix
      ../../modules/programs/ssh.nix
      ../../modules/programs/ydotool.nix
      ../../modules/programs/zsh.nix
      ../../modules/programs/tailscale.nix
      ../../modules/programs/udisks2.nix
      ../../modules/programs/zerotierone.nix
      ./modules/boot.nix
      ./modules/network.nix
      ./modules/users.nix
      ./modules/hardware.nix
      ./modules/services/restic.nix
    ];

  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
