{ config, pkgs, ... }:

{
  imports = [
    ./xserver.nix
    ./greetd.nix
    ./tailscale.nix
    ./flatpak.nix
    ./restic.nix
    ./zerotierone.nix
    ./udisks2.nix
    ./ratbagd.nix
  ];
}
