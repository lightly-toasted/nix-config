{ pkgs, config, rootPath, lib, ... }:

let
  tunnel = "cb0d9c2c-48f9-4bca-9e81-ef92423c5afa";
  subdomains = [
    "gist.toast.name"
  ];
in
{
  home.file.".cloudflared/${tunnel}.json".source = rootPath + /secrets/gitcrypt/cloudflared/${tunnel}.json;
  home.file.".cloudflared/cert.pem".source = rootPath + /secrets/gitcrypt/cloudflared/cert.pem;
  home.file.".cloudflared/config.yml".text = ''
    tunnel: ${tunnel}
    credentials-file: ${config.home.homeDirectory}/.cloudflared/${tunnel}.json

    ingress:
    ${lib.concatMapStringsSep "\n" (host: ''
      ${"  "}- hostname: ${host}
      ${"  "}  service: http://localhost:80
    '') subdomains}
    ${"  "}- service: http_status:404
  '';

  runit.services.cloudflared = {
    script = ''
      exec ${pkgs.cloudflared}/bin/cloudflared tunnel run
    '';
    log.enable = true;
  };
}
