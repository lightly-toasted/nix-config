{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./hyprland.nix
    ./thunar.nix
    ./xfconf.nix
    ./ssh.nix
    ./ydotool.nix
    ./steam.nix
    ./nix-ld.nix
    ./nh.nix
  ];
}
