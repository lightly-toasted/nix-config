{
  services.caddy = {
    # PufferPanel
    virtualHosts."panel.ts.700457.xyz".extraConfig = ''
      tls {
        dns cloudflare {env.CF_API_TOKEN}
      }
      reverse_proxy localhost:8080
    '';
  };
}
