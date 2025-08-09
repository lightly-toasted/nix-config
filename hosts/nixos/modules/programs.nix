{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-volman
    ];
  };
  programs.xfconf.enable = true;
}
