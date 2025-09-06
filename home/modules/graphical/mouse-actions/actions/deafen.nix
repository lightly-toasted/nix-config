{ pkgs, ... }:

let
  script = pkgs.writeShellScriptBin "deafen-action" ''
    hyprctl dispatch sendshortcut CTRL+SHIFT, D, 'class:^(discord)$'
  '';
in
{
  package = pkgs.symlinkJoin {
    name = "deafen-action";
    paths = [ script pkgs.hyprland ];
  };
}
