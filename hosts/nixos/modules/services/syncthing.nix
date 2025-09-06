{
  services.syncthing = {
    enable = true;
    extraFlags = [ "--no-default-folder" ];
  };
}
