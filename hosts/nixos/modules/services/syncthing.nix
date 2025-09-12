{
  services.syncthing = {
    enable = true;
    user = "toast";
    group = "users";
    configDir = "/home/toast/.config/syncthing";
    extraFlags = [ "--no-default-folder" ];
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "phone" = { id = "XIRT2YS-3PZY7PF-PL4QTYK-LCYCSKW-GARN5N6-KBWGSP6-YZDQGED-N7R6YQF"; };
      };
      folders = {
        "keepass" = {
          path = "/data/Backup/Keepass/";
          devices = [ "phone" ];
        };
        "obsidian" = {
          path = "/home/toast/Obsidian/";
          devices = [ "phone" ];
        };
      };
    };
  };
}
