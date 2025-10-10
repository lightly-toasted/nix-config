{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim

    ../modules/cli/git.nix
    ../modules/cli/ripgrep.nix
    ../modules/cli/btop.nix
    ../modules/cli/yazi.nix
    ../modules/cli/nixvim
  ];

  home = {
    username = "android";
    homeDirectory = "/home/android";
    stateVersion = "24.11";
  };

  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = "sd-switch";
}
