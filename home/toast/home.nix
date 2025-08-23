{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nixcord.homeModules.nixcord
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    inputs.sops-nix.homeManagerModules.sops
    
    ./modules/kitty.nix
    ./modules/git.nix
    ./modules/nixvim
    ./modules/fonts.nix
    ./modules/hyprland.nix
    ./modules/tofi.nix
    ./modules/zsh.nix
    ./modules/firefox.nix
    ./modules/yazi.nix
    ./modules/nixcord.nix
    ./modules/nodejs.nix
    ./modules/btop.nix
    ./modules/waybar
    ./modules/dunst.nix
    ./modules/keepassxc.nix
    ./modules/mouse-actions
    ./modules/hypridle.nix
    ./modules/obsidian.nix
    ./modules/xdg.nix
    ./modules/sops.nix
    ./modules/gemini-cli.nix
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
