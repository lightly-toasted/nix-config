{ config, pkgs, ... }:

{
  sops.secrets.caddy_env = {};
  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      plugins = [ "github.com/caddy-dns/cloudflare@v0.2.4" ];
      hash = "sha256-J0HWjCPoOoARAxDpG2bS9c0x5Wv4Q23qWZbTjd8nW84=";
    };
    environmentFile = config.sops.secrets.caddy_env.path;
  };
}
