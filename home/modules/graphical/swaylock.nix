{ pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      ignore-empty-password = true;
      daemonize = true;

      color = "000000";

      indicator = true;
      indicator-radius = 120;
      indicator-thickness = 10;

      inside-color = "00000000";
      inside-clear-color = "00000000";
      inside-ver-color = "00000000";
      inside-wrong-color = "00000000";

      ring-color = "ffb94f";
      ring-clear-color = "ffb94f";
      ring-ver-color = "ffb94f";
      ring-wrong-color = "ff5555";

      line-color = "00000000";
      line-clear-color = "00000000";
      line-ver-color = "00000000";
      line-wrong-color = "00000000";
      separator-color = "00000000";

      key-hl-color = "ffffff";
      bs-hl-color = "ff5555";

      text-color = "ffb94f";
      text-clear-color = "ffb94f";
      text-ver-color = "ffb94f";
      text-wrong-color = "ff5555";

      font = "Maple Mono NF";
      font-size = 24;

      clock = true;
      timestr = "  %H:%M:%S";
      datestr = "";
    };
  };
}
