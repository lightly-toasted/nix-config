{ lib, ... }:

{
  services.restic.server = {
    enable = true;
    listenAddress = lib.mkDefault "0.0.0.0:3005";
  };
}
