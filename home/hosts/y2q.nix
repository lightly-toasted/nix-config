{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim

    ../modules/cli/git.nix
    ../modules/cli/ripgrep.nix
    ../modules/cli/btop.nix
    ../modules/cli/yazi.nix
    ../modules/cli/nixvim
    ../modules/cli/zsh.nix
    ../modules/cli/direnv.nix
  ];

  home = {
    username = "toast";
    homeDirectory = "/home/toast";
    stateVersion = "24.11";
  };

  programs.zsh.initContent = ''
    PROMPT='%n@%m:%~/ > '
    export EDITOR="nvim"
    export VISUAL="nvim"
    export LANG=en_US.UTF-8
  '';

  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = "sd-switch";
}
