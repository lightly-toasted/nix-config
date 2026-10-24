{ config, ... }:

{
  services.caddy = {
    globalConfig = ''
      acme_dns cloudflare {env.CF_API_TOKEN}
    '';
    # PufferPanel
    virtualHosts."pufferpanel.ts.700457.xyz".extraConfig = ''
      reverse_proxy localhost:8080
    '';
    # Flatnotes
    virtualHosts."flatnotes.ts.700457.xyz".extraConfig = ''
      reverse_proxy localhost:3001
    '';
    # Immich
    virtualHosts."immich.ts.700457.xyz".extraConfig = ''
      reverse_proxy localhost:${toString config.services.immich.port}
    '';
    # Wallos
    virtualHosts."wallos.ts.700457.xyz".extraConfig = ''
      reverse_proxy localhost:3002
    '';
    # Technitium DNS
    virtualHosts."dns.ts.700457.xyz".extraConfig = ''
      reverse_proxy localhost:3004
    '';
    # Gluetun WebUI
    virtualHosts."gluetun.ts.700457.xyz".extraConfig = ''
      reverse_proxy localhost:3007
    '';
  };
}
