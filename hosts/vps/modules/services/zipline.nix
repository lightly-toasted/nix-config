{ config, ... }:

{
  sops.secrets."zipline" = { };
  services.zipline = {
    enable = true;
    settings = {
      CORE_HOSTNAME = "127.0.0.1";
      CORE_PORT = 3000;
    };
    environmentFiles = [ config.sops.secrets."zipline".path ];
  };
}
