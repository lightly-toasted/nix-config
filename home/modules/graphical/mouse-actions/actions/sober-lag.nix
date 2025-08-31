{ pkgs, ... }:

let
  script = pkgs.writeShellScriptBin "sober-lag-action" ''
    roblox_pid=$(ps aux | grep "[s]ober --" | sort -k3 -nr | head -n 1 | awk '{print $2}')
    if [ -z "$roblox_pid" ]; then
      notify-send "sober-lag.sh" "Sober is not running."
      exit 1
    fi

    pgid=$(ps -o pgid= -p "$roblox_pid" | xargs)
    if [ -z "$pgid" ]; then
      notify-send "sober-lag.sh" "Could not find PGID for PID $roblox_pid."
      exit 1
    fi

    kill -STOP -- "-$pgid"
    sleep 0.2
    kill -CONT -- "-$pgid"
  '';
in
{
  package = pkgs.symlinkJoin {
    name = "sober-lag-action";
    paths = [ script pkgs.procps pkgs.gawk pkgs.gnugrep pkgs.gnused pkgs.coreutils pkgs.libnotify ];
  };
}
