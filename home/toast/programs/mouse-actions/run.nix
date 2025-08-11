{ pkgs, actions }:

let
  script = pkgs.writeShellScriptBin "run-mouse-action" ''
    STATE_FILE="$HOME/.config/mouse-actions/state"
    
    if [ ! -f "$STATE_FILE" ]; then
        exit 0
    fi

    ACTION_NAME=$(<"$STATE_FILE")

    case "$ACTION_NAME" in
        "deafen")
            systemd-run --user ${actions.deafen.package}/bin/deafen-action
            ;;
        "sober-lag")
            systemd-run --user ${actions.sober-lag.package}/bin/sober-lag-action
            ;;
        "autoclick")
            systemd-run --user ${actions.autoclick.package}/bin/autoclick-action
            ;;
    esac
  '';
in
{
  package = pkgs.symlinkJoin {
    name = "run-mouse-action";
    paths = [ script pkgs.systemd ];
  };
}
