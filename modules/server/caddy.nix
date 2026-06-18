{ config, pkgs, ... }:

{
  sops.secrets.caddy_env = {};
  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      plugins = [ "github.com/caddy-dns/cloudflare@v0.2.4" ];
      hash = "sha256-bzMqxWTqrJ1skZmRTXyEMCKStXpljbqe5r0Ve2cnBfM=";
    };
    environmentFile = config.sops.secrets.caddy_env.path;
  };
}
