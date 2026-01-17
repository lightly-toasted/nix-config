{ config, ... }:

{
  sops.secrets = {
    "restic/password" = {};
    "restic/env/vps" = {};
  };

  services.restic.backups.y2q = {
    initialize = true;
    inhibitsSleep = true;
    passwordFile = config.sops.secrets."restic/password".path;
    paths = [
      "/var/lib/zipline"
      "/var/lib/postgresql"
      "/var/lib/forgejo"
      "/var/lib/trilium"
      "/var/lib/bitwarden_rs"
    ];
    repository = "rest:http://restic.ts.700457.xyz/vps/";
    environmentFile = config.sops.secrets."restic/env/vps".path;
    pruneOpts = [
      "--keep-hourly 3"
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
