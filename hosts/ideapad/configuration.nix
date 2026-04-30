{ inputs, ... }:

{
  imports =
    [ 
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
      ../../modules/graphical/thunar.nix
      ../../modules/graphical/xfconf.nix
      ../../modules/graphical/xserver.nix
      ../../modules/programs/nh.nix
      ../../modules/programs/nix-ld.nix
      ../../modules/programs/ssh.nix
      ../../modules/programs/ydotool.nix
      ../../modules/programs/zsh.nix
      ../../modules/services/tailscale.nix
      ../../modules/services/udisks2.nix
      ../../modules/services/zerotierone.nix
      ../../modules/services/openssh.nix
      ./modules/boot.nix
      ./modules/network.nix
      ./modules/users.nix
    ];

  system.stateVersion = "25.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
