{ pkgs, ... }:

{
  package = pkgs.writeShellScriptBin "sober-lag-action" ''
    roblox_pid=$(${pkgs.procps}/bin/ps aux \
      | ${pkgs.gnugrep}/bin/grep "[s]ober --" \
      | ${pkgs.coreutils}/bin/sort -k3 -nr \
      | ${pkgs.coreutils}/bin/head -n 1 \
      | ${pkgs.gawk}/bin/awk '{print $2}')

    if [ -z "$roblox_pid" ]; then
      ${pkgs.libnotify}/bin/notify-send "sober-lag.sh" "Sober is not running."
      exit 1
    fi

    pgid=$(${pkgs.procps}/bin/ps -o pgid= -p "$roblox_pid" | ${pkgs.coreutils}/bin/xargs)

    if [ -z "$pgid" ]; then
      ${pkgs.libnotify}/bin/notify-send "sober-lag.sh" "Could not find PGID for PID $roblox_pid."
      exit 1
    fi

    ${pkgs.coreutils}/bin/kill -STOP -- "-$pgid"
    ${pkgs.coreutils}/bin/sleep 0.2
    ${pkgs.coreutils}/bin/kill -CONT -- "-$pgid"
  '';
}
