{
  services.tailscale = {
    useRoutingFeatures = "both";
    permitCertUid = "caddy";
    extraUpFlags = [ "--ssh" ];
  };
}
