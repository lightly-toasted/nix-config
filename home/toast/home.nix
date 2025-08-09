{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nixcord.homeModules.nixcord
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    
    ./programs/kitty.nix
    ./programs/git.nix
    ./programs/nixvim
    ./programs/fonts.nix
    ./programs/hyprland.nix
    ./programs/tofi.nix
    ./programs/zsh.nix
    ./programs/firefox.nix
    ./programs/yazi.nix
    ./programs/nixcord.nix
    ./programs/nodejs.nix
    ./programs/btop.nix
    ./programs/waybar
    ./programs/dunst.nix
  ];
  
  home = {
    username = "toast";
    homeDirectory = "/home/toast";
    stateVersion = "24.11";
    file = {
      "bin" = { source = ./bin; recursive = true; };
    };
  };
  
  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = "sd-switch";
}
