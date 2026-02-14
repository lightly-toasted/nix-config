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
    font-util
    font-bh-75dpi
    font-bh-100dpi
    
    mkfontscale
    nerd-fonts.jetbrains-mono
  ];
}
