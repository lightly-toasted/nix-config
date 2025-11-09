{ pkgs, actions }:

{
  package = pkgs.writeShellScriptBin "run-mouse-action" ''
    STATE_FILE="$HOME/.config/mouse-actions/state"
    
    if [ ! -f "$STATE_FILE" ]; then
        exit 0
    fi

    ACTION_NAME=$(<"$STATE_FILE")

    case "$ACTION_NAME" in
        "deafen")
            ${pkgs.systemd}/bin/systemd-run --user ${actions.deafen.package}/bin/deafen-action
            ;;
        "sober-lag")
            ${pkgs.systemd}/bin/systemd-run --user ${actions.sober-lag.package}/bin/sober-lag-action
            ;;
        "autoclick")
            ${pkgs.systemd}/bin/systemd-run --user ${actions.autoclick.package}/bin/autoclick-action
            ;;
        "flick")
            ${pkgs.systemd}/bin/systemd-run --user ${actions.flick.package}/bin/flick-action
            ;;
    esac
  '';
}
