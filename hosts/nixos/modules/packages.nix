{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
  ];
  nixpkgs.config.allowUnfree = true;
}
