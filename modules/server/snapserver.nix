{ lib, ... }:

{
  services.snapserver = {
    enable = true;
    settings = {
      tcp-streaming.enabled = lib.mkDefault true;
      tcp-control.enabled = lib.mkDefault true;
    };
  };
}
