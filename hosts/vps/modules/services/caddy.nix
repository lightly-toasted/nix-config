{ pkgs, ... }:

{
  services.caddy = {
    enable = true;
    
    # zipline
    virtualHosts."i.toast.name".extraConfig = ''
      reverse_proxy http://127.0.0.1:3000
    '';

    # vaultwarden
    virtualHosts."vps.curl-pence.ts.net".extraConfig = ''
      reverse_proxy /vaultwarden/* http://127.0.0.1:8222
    '';
  };
}
