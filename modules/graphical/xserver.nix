{ config, pkgs, ... }:

{
  services.xserver = {
    xkb.layout = "us";
    videoDrivers = [ "nvidia" ];
  };
}
