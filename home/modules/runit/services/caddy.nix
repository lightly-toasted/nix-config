{ pkgs, config, ... }:

{
  home.file.".config/caddy/Caddyfile".text = ''
    {
      http_port 8080
      https_port 8443
      auto_https off
    }

    # Cloudflare Tunnel
    http://gist.toast.name {
      # Opengist
      reverse_proxy http://localhost:${config.runit.services.opengist.environment.OG_HTTP_PORT}
    }
    
    # Tailscale
    http://y2q.ts.toast.name {
      # Glances
      reverse_proxy http://localhost:61208
    }

    http://grafana.ts.toast.name {
      # Grafana
      reverse_proxy http://localhost:${config.runit.services.grafana.environment.GF_SERVER_HTTP_PORT}
    }
  '';

  runit.services.caddy = {
    script = ''
      exec ${pkgs.caddy}/bin/caddy run \
        --config "$HOME/.config/caddy/Caddyfile" \
        --adapter caddyfile
    '';
    log.enable = true;
  };
}
