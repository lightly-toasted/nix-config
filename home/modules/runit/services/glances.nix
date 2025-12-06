{ pkgs, ... }:

{
  runit.services.glances = {
    script = ''
      #!/bin/bash
      ${pkgs.glances}/bin/glances -w
    '';
  };
}
