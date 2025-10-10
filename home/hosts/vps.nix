{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.sops-nix.homeManagerModules.sops

    ../modules/cli/git.nix
    ../modules/cli/ripgrep.nix
    ../modules/cli/sops.nix
    ../modules/cli/yazi.nix
    ../modules/cli/btop.nix
  ];

  home = {
    username = "toast";
    homeDirectory = "/home/toast";
    stateVersion = "24.11";
  };

  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = "sd-switch";
}
