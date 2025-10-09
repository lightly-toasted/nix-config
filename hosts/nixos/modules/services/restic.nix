{ config, ... }:

{
  sops.secrets = {
    "restic/password" = {};
    "restic/env" = {};
  };

  services.restic.backups.b2 = {
    initialize = true;
    inhibitsSleep = true;
    passwordFile = config.sops.secrets."restic/password".path;
    paths = [
      "/data/Backup"
      "/home/toast/workspace"
    ];
    exclude = [ "node_modules" ];
    repository = "s3:https://s3.us-east-005.backblazeb2.com/restic-backups-0";
    environmentFile = config.sops.secrets."restic/env".path;
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
