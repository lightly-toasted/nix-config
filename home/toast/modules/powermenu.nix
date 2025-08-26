{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "powermenu" ''
      choice=$(printf """
󰍃 Logout
⏻ Shutdown
 Reboot
 Suspend
 Hibernate
      """ | ${pkgs.tofi}/bin/tofi)

      case "$choice" in
        "󰍃 Logout") ${pkgs.uwsm}/bin/uwsm stop ;;
        "⏻ Shutdown") ${pkgs.systemd}/bin/systemctl poweroff ;;
        " Reboot")  ${pkgs.systemd}/bin/systemctl reboot ;;
        " Suspend") ${pkgs.systemd}/bin/systemctl suspend ;;
        " Hibernate") ${pkgs.systemd}/bin/systemctl hibernate ;;
      esac
    '')
  ];
}

