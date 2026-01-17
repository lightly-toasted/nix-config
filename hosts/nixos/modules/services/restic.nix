{ config, ... }:

{
  sops.secrets = {
    "restic/password" = {};
    "restic/env/nixos" = {};
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
    repository = "rest:http://restic.ts.700457.xyz/nixos/";
    environmentFile = config.sops.secrets."restic/env/nixos".path;
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
