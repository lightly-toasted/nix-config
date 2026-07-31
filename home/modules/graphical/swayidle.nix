{ pkgs, ... }: {
  services.swayidle = {
    enable = true;
    events = {
      "before-sleep" = "${pkgs.swaylock}/bin/swaylock -f";
      "after-resume" = "niri msg action power-on-monitors";
    };
    timeouts = [
      {
        timeout = 300;
        command = "niri msg action power-off-monitors";
        resumeCommand = "niri msg action power-on-monitors";
      }
    ];
  };
}
