{ pkgs }:

{
  package = pkgs.writeShellScriptBin "cycle-mouse-action" ''
    STATE_FILE="$HOME/.config/mouse-actions/state"
    mkdir -p "$(dirname "$STATE_FILE")"

    if [ -f "$STATE_FILE" ]; then
        CURRENT_ACTION=$(cat "$STATE_FILE")
    else
        CURRENT_ACTION="deafen"
    fi

    case "$CURRENT_ACTION" in
        "deafen") NEW_ACTION="sober-lag" ;;
        "sober-lag") NEW_ACTION="autoclick" ;;
        "autoclick") NEW_ACTION="flick" ;;
        *) NEW_ACTION="deafen"
    esac

    echo "$NEW_ACTION" > "$STATE_FILE.tmp"
    mv "$STATE_FILE.tmp" "$STATE_FILE"
  '';
}
