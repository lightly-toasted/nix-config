{ pkgs, ... }:

let
  script = pkgs.writeShellScriptBin "flick-action" ''
    if ! command -v ydotool >/dev/null 2>&1; then
      notify-send -r 120000 "Flick" "This tool requires ydotool to be installed on your system."
    fi
    ydotool mousemove -- 800 0
    sleep 0.03
    ydotool mousemove -- -800 0
  '';
in
{
  package = pkgs.symlinkJoin {
    name = "autoclick-action";
    paths = [ script pkgs.libnotify ];
  };
}
