{ pkgs, ... }:

let
  script = pkgs.writeShellScriptBin "autoclick-action" ''
    if ! command -v ydotool >/dev/null 2>&1; then
      notify-send -r 120000 "Autoclicker" "This tool requires ydotool to be installed on your system."
    fi

    AUTOCLICK_FILE="/run/user/$(id -u)/autoclick"

    if [ ! -f "$AUTOCLICK_FILE" ]; then
      echo "1" > "$AUTOCLICK_FILE"
    fi

    current=$(cat "$AUTOCLICK_FILE")
    if [ "$current" = "0" ]; then
      echo "1" > "$AUTOCLICK_FILE"
      notify-send -r 120000 "Autoclicker" "Stopped"
      exit 0
    else
      echo "0" > "$AUTOCLICK_FILE"
      notify-send -r 120000 "Autoclicker" "Started"
    fi

    while :; do
      line=$(cat "$AUTOCLICK_FILE")
      if [ "$line" = "0" ]; then
        ydotool click --next-delay 25 0xC0 > /dev/null 2>&1
      else
        break
      fi
    done
  '';
in
{
  package = pkgs.symlinkJoin {
    name = "autoclick-action";
    paths = [ script pkgs.libnotify ];
  };
}
