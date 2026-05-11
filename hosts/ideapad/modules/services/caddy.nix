{ config, ... }:

{
  services.caddy = {
    # PufferPanel
    virtualHosts."pufferpanel.ts.700457.xyz".extraConfig = ''
      tls {
        dns cloudflare {env.CF_API_TOKEN}
      }
      reverse_proxy localhost:8080
    '';
    # Flatnotes
    virtualHosts."flatnotes.ts.700457.xyz".extraConfig = ''
      tls {
        dns cloudflare {env.CF_API_TOKEN}
      }
      reverse_proxy localhost:3001
    '';
    # Immich
    virtualHosts."immich.ts.700457.xyz".extraConfig = ''
      tls {
        dns cloudflare {env.CF_API_TOKEN}
      }
      reverse_proxy localhost:${toString config.services.immich.port}
    '';
  };
}
