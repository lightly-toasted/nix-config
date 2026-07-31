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
        " Lock")  ${pkgs.swaylock-effects}/bin/swaylock ;;
        "󰍃 Logout") ${pkgs.niri}/bin/niri msg action quit ;;
        " Suspend") ${pkgs.systemd}/bin/systemctl suspend ;;
        " Hibernate") ${pkgs.systemd}/bin/systemctl hibernate ;;
      esac
    '')
  ];
}

