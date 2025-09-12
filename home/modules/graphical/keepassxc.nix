{
  programs.keepassxc = {
    enable = true;
    settings = {
      Browser = {
        Enabled = true;
        UpdateBinaryPath = false;
        AllowLocalhostWithPasskeys = true;
      };
      GUI = {
        MinimizeToTray = true;
        MinimizeOnStartup = true;
        MinimizeOnClose = true;
        ShowTrayIcon = true;
      };
    };
  };
}
