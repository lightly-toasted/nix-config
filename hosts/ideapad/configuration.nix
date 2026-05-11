{ inputs, ... }:

{
  imports =
    [ 
      inputs.sops-nix.nixosModules.sops
      inputs.lanzaboote.nixosModules.lanzaboote
      ./hardware-configuration.nix
    ] ++ [
      ./modules/boot.nix
      ./modules/network.nix
      ./modules/users.nix
      ../../modules/common
      ../../modules/programs/environment.nix
      ../../modules/programs/greetd.nix
      ../../modules/programs/hyprland.nix
      ../../modules/programs/thunar.nix
      ../../modules/programs/xfconf.nix
      ../../modules/programs/xserver.nix
      ../../modules/programs/nh.nix
      ../../modules/programs/nix-ld.nix
      ../../modules/programs/ssh.nix
      ../../modules/programs/ydotool.nix
      ../../modules/programs/zsh.nix
      ../../modules/programs/udisks2.nix
      ../../modules/programs/tailscale.nix
      ../../modules/programs/zerotierone.nix
      ../../modules/server/openssh.nix
      ../../modules/server/pufferpanel.nix
      ../../modules/server/caddy.nix
      ../../modules/server/docker.nix
      ../../modules/server/flatnotes.nix
      ../../modules/server/immich.nix
      ./modules/services/caddy.nix
    ];

  system.stateVersion = "25.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
