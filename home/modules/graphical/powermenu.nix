{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "powermenu" ''
      choice=$(printf """
 Lock
󰍃 Logout
⏻ Shutdown
 Reboot
 Suspend
 Hibernate
      """ | ${pkgs.tofi}/bin/tofi)

      case "$choice" in
        "⏻ Shutdown") ${pkgs.systemd}/bin/systemctl poweroff ;;
        " Reboot")  ${pkgs.systemd}/bin/systemctl reboot ;;
        " Lock")  hyprlock ;;
        "󰍃 Logout") ${pkgs.uwsm}/bin/uwsm stop ;;
        " Suspend") ${pkgs.systemd}/bin/systemctl suspend ;;
        " Hibernate") ${pkgs.systemd}/bin/systemctl hibernate ;;
      esac
    '')
  ];
}

