{ config, pkgs, ... }:

{
  networking.hostName = "vps";
  networking.domain = "";
  networking.firewall.enable = true;
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
}
