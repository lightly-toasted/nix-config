{ pkgs, config, rootPath, ... }:

let
  tunnel = "cb0d9c2c-48f9-4bca-9e81-ef92423c5afa";
in
{
  home.file.".cloudflared/${tunnel}.json".source = rootPath + /secrets/gitcrypt/cloudflared/${tunnel}.json;
  home.file.".cloudflared/cert.pem".source = rootPath + /secrets/gitcrypt/cloudflared/cert.pem;
  home.file.".cloudflared/config.yml".text = ''
    tunnel: ${tunnel}
    credentials-file: ${config.home.homeDirectory}/.cloudflared/${tunnel}.json

    ingress:
      - hostname: gist.toast.name
        service: http://${config.runit.services.opengist.environment.OG_HTTP_HOST}:${config.runit.services.opengist.environment.OG_HTTP_PORT}

      - service: http_status:404
  '';

  runit.services.cloudflared = {
    script = ''
      exec ${pkgs.cloudflared}/bin/cloudflared tunnel run
    '';
    log.enable = true;
  };
}
