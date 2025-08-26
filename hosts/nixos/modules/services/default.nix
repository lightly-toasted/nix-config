{ config, pkgs, ... }:

{
  imports = [
    ./xserver.nix
    ./greetd.nix
    ./tailscale.nix
    ./flatpak.nix
    ./restic.nix
  ];
}
