{ config, pkgs, ... }:

{
  sops.secrets."tailscale/authkey" = { };

  services.tailscale = {
    enable = true;
    authKeyFile = config.sops.secrets."tailscale/authkey".path;
    useRoutingFeatures = "both";
  };
}
