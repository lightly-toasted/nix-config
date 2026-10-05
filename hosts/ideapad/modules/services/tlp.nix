{ lib, ... }:

{
  services.tlp = {
    enable = lib.mkDefault true;
    settings = {
      DEVICES_TO_DISABLE_ON_LAN_CONNECT = [ "wifi" ];
      DEVICES_TO_ENABLE_ON_LAN_DISCONNECT = [ "wifi" ];
    };
  };
}
