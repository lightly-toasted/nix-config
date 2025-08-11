{ lib, pkgs, config, ... }:

{
  options.programs.mouse-actions.enable = lib.mkEnableOption "mouse-actions";
  config = lib.mkIf config.programs.mouse-actions.enable
    (let
      cfg = config.programs.mouse-actions;
      actions = import ./actions { inherit pkgs; };

      cycle-script = import ./cycle.nix { inherit pkgs; };
      run-script = import ./run.nix { inherit pkgs; actions = actions; };
    in {
      home.packages = [
        cycle-script.package
        run-script.package
      ];
    });
}
