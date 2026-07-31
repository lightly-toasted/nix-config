{ config, pkgs, ... }:

{
  sops.secrets.caddy_env = {};
  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      plugins = [ "github.com/caddy-dns/cloudflare@v0.2.4" ];
      hash = "sha256-hEHgAG0F0ozHRAPuxEqLyTATBrE+pajeXDiSNwniorg=";
    };
    environmentFile = config.sops.secrets.caddy_env.path;
  };
}
