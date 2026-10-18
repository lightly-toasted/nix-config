{
  services.restic.server = {
    dataDir = "/data/restic";
    appendOnly = true;
    extraFlags = [ "--no-auth" ];
  };
}
