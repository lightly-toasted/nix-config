{ pkgs, ... }: {
  xdg = {
    enable = true;
    portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/roblox-player" = "org.vinegarhq.Sober.desktop";
        "x-scheme-handler/roblox-studio" = "org.vinegarhq.Vinegar.studio.desktop";
        "x-scheme-handler/roblox-studio-auth" = "org.vinegarhq.Vinegar.studio.desktop";
      };
    };
    configFile."mimeapps.list".force = true;
  };
}
