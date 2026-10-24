{ config, ... }:

{
  sops.secrets.gluetun_env = {};
  sops.secrets.gluetun_tailscale_env = {};
  virtualisation.oci-containers.containers = {
    gluetun = {
      image = "docker.io/qmcgaw/gluetun:latest";
      environment = {
        TZ = "Asia/Seoul";
      };
      environmentFiles = [ config.sops.secrets."gluetun_env".path ];
      capabilities = {
        NET_ADMIN = true;
      };
      volumes = [
        "/var/lib/gluetun:/gluetun"
      ];
    };
    gluetun-tailscale = {
      image = "tailscale/tailscale:stable";
      extraOptions = [ "--network=container:gluetun" ];
      capabilities = {
        NET_ADMIN = true;
        NET_RAW = true;
      };
      volumes = [
        "/var/lib/gluetun-tailscale/varlib:/var/lib/tailscale"
        "/dev/net/tun:/dev/net/tun"
      ];
      dependsOn = [ "gluetun" ];
      environmentFiles = [ config.sops.secrets."gluetun_tailscale_env".path ];
    };
  };
}
