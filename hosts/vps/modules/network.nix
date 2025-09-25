{ config, pkgs, ... }:

{
  networking.hostName = "vps";
  networking.domain = "";
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 443 ];
  };
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
}
