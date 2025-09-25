{
  services.caddy = {
    enable = true;
    
    # zipline
    virtualHosts."i.toast.name".extraConfig = ''
      reverse_proxy http://127.0.0.1:3000
    '';
  };
}
