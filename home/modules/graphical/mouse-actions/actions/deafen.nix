{ pkgs, ... }:

{
  package = pkgs.writeShellScriptBin "deafen-action" ''
    equibop --toggle-deafen
  '';
}
