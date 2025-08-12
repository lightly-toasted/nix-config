{
  programs.keepassxc = {
    enable = true;
    settings = {
      Browser = {
        Enabled = true;
        UpdateBinaryPath = false;
        AllowLocalhostWithPasskeys = true;
      };
      SSHAgent.Enabled = true;
      GUI = {
        MinimizeToTray = true;
        MinimizeOnStartup = true;
        MinimizeOnClose = true;
        ShowTrayIcon = true;
      };
    };
  };
}
