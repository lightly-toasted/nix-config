{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;
    settings = [{
      position = "top";
      height = 5;
      output = "HDMI-A-1";
      modules-left = [ ];
      modules-center = [ ];
      modules-right = [
        "pulseaudio"
        "network"
        "cpu"
        "memory"
        "systemd-failed-units"
        "clock"
        "tray"
      ];

      tray.spacing = 10;

      clock = {
        format = "{:%I:%M }";
        format-alt = "{:%Y-%m-%d}";
        tooltip = false;
      };

      cpu = {
        format = "{usage}% ";
        on-click = "kitty btop";
      };

      memory = {
        format = "{}% ";
        on-click = "kitty btop";
      };

      network = {
        format-wifi = "{essid} ({signalStrength}%) ";
        format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "Disconnected ";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };

      pulseaudio = {
        format = "{volume}%  {format_source}";
        format-bluetooth = "{volume}%  {format_source}";
        format-bluetooth-muted = "   {format_source}";
        format-muted = "   {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      };

      systemd-failed-units = {
        hide-on-ok = false;
        format = "✗ {nr_failed}";
        format-ok = "✓";
        system = true;
        user = false;
      };
    }];
  };
}
