{ config, ... }:

{
  sops.secrets = {
    "restic/password" = {};
    "restic/env" = {};
  };

  services.restic.backups.y2q = {
    initialize = true;
    inhibitsSleep = true;
    passwordFile = config.sops.secrets."restic/password".path;
    paths = [
      "/data/Backup"
      "/home/toast/workspace"
    ];
    exclude = [ "node_modules" ];
    repository = "rest:http://y2q:9000/nixos/";
    environmentFile = config.sops.secrets."restic/env".path;
    pruneOpts = [
      "--keep-hourly 6"
      "--keep-daily 7"
      "--keep-weekly 3"
      "--keep-monthly 3"
    ];
    timerConfig = {
      OnCalendar = "hourly";
      Persistent = true;
    };
  };
}
