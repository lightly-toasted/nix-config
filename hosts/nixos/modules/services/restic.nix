{ config, ... }:

{
  sops.secrets."restic/password" = { };
  sops.secrets."restic/rclone-config" = { };

  services.restic.backups.gdrive = {
    initialize = true;
    inhibitsSleep = true;
    passwordFile = config.sops.secrets."restic/password".path;
    paths = [
      "/data/Backup"
      "/home/toast/workspace"
    ];
    repository = "rclone:gdrive:restic";
    rcloneConfigFile = config.sops.secrets."restic/rclone-config".path;
    pruneOpts = [
      "--keep-daily 7"
      "--keep-weekly 3"
      "--keep-monthly 3"
    ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };
}
