{ pkgs, ... }:

{
  runit.services.glances = {
    script = ''
      exec ${pkgs.glances}/bin/glances -w
    '';
  };
}
