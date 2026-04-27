{
  services.restic.server = {
    enable = true;
    appendOnly = true;
    listenAddress = "127.0.0.1:3003";
    extraFlags = [ "--no-auth" ];
  };
}
