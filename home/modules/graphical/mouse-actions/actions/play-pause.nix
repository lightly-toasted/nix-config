{ pkgs, ... }:

{
  package = pkgs.writeShellScriptBin "play-pause-action" ''
    ${pkgs.playerctl}/bin/playerctl play-pause
  '';
}
