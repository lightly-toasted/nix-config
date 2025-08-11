{ pkgs }:

{
  autoclick = import ./autoclick.nix { inherit pkgs; };
  deafen = import ./deafen.nix { inherit pkgs; };
  sober-lag = import ./sober-lag.nix { inherit pkgs; };
}
