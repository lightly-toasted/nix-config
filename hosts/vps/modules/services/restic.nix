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
      "/var/lib/zipline"
      "/var/lib/postgresql"
      "/var/lib/forgejo"
      "/var/lib/trilium"
      "/var/lib/bitwarden_rs"
    ];
    repository = "s3:https://s3.us-east-005.backblazeb2.com/restic-backups-vps";
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
