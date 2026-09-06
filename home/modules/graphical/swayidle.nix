{ pkgs, ... }: {
  services.swayidle = {
    enable = true;
    events = {
      "before-sleep" = "${pkgs.swaylock}/bin/swaylock -f";
      "after-resume" = "${pkgs.niri}/bin/niri msg action power-on-monitors";
    };
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
        resumeCommand = "${pkgs.niri}/bin/niri msg action power-on-monitors";
      }
    ];
  };
}
