{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nixcord.homeModules.nixcord
    
    ./programs/kitty.nix
    ./programs/git.nix
    ./programs/nixvim
    ./programs/fonts.nix
    ./programs/hyprland.nix
    ./programs/tofi.nix
    ./programs/wlogout.nix
    ./programs/zsh.nix
    ./programs/firefox.nix
    ./programs/yazi.nix
    ./programs/nixcord.nix
    ./programs/prismlauncher.nix
    ./programs/nodejs.nix
    ./programs/btop.nix
  ];
  
  home = {
    username = "toast";
    homeDirectory = "/home/toast";
    stateVersion = "24.11";
  };
  
  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = "sd-switch";
}
