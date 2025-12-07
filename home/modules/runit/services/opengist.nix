{ pkgs, rootPath, ... }:

{
  runit.services.opengist = {
    script = ''
      exec ${pkgs.opengist}/bin/opengist start
    '';
    
    environment = {
      OG_HTTP_HOST = "127.0.0.1";
      OG_HTTP_PORT = "6157";
      OG_SSH_HOST = "127.0.0.1";
      OG_SSH_PORT = "6522";
    };

    environmentFile = rootPath + /secrets/gitcrypt/opengist.env;

    log.enable = true;
  };
}
