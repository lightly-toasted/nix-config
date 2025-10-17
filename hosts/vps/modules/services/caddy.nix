{ config, ... }:

{
  services.caddy = {
    enable = true;
    
    # zipline
    virtualHosts."i.toast.name".extraConfig = ''
      reverse_proxy http://127.0.0.1:${toString config.services.zipline.settings.CORE_PORT}
    '';

    # forgejo
    virtualHosts."git.toast.name".extraConfig = ''
      reverse_proxy http://127.0.0.1:${toString config.services.forgejo.settings.server.HTTP_PORT}
    '';

    # tailscale
    virtualHosts."vps.curl-pence.ts.net".extraConfig = ''
      reverse_proxy /vaultwarden/* http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}
      handle_path /trilium/* {
        reverse_proxy http://127.0.0.1:${toString config.services.trilium-server.port}
      }
    '';
  };
}
