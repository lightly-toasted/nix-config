{ lib, ... }:

{
  security.rtkit.enable = lib.mkDefault true;
  services.pipewire.extraConfig.pipewire."98-quantum-512" = {
    "context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 512;
      "default.clock.min-quantum" = 512;
      "default.clock.max-quantum" = 512;
    };
  };
}
