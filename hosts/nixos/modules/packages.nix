{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    sbctl
  ];
  nixpkgs.config.allowUnfree = true;
}
