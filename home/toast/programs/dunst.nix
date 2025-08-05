{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        follow = "mouse";
        frame_width = 1;
        icon_position = "off";
        corner_radius = 4;
      };
      urgency_low = {
        background = "#1e1e1e";
        foreground = "#fefefe";
      };
      urgency_normal = {
        background = "#0c0c00";
        foreground = "#fcfcff";
      };
      urgency_critical = {
        background = "#300e00";
        foreground = "#ffffff";
        frame_color = "#ce1f00";
        frame_width = 2;
      };
    };
  };
}
