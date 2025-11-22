{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    dejavu_fonts
    fira-code
    font-awesome
    liberation_ttf
    xorg.fontutil
    xorg.fontbh100dpi
    xorg.fontbh75dpi
    
    xorg.mkfontscale
    nerd-fonts.jetbrains-mono
  ];
}
