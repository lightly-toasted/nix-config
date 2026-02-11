{ pkgs, ... }:

{
  package = pkgs.writeShellScriptBin "deafen-action" ''
    ${pkgs.hyprland}/bin/hyprctl dispatch sendshortcut CTRL+SHIFT, D, 'class:^(discord)$'
  '';
}
