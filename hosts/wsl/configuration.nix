{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.default
  ];

  wsl.enable = true;
  wsl.defaultUser = "toast";
  programs.zsh.enable = true;
  users.users.toast.shell = pkgs.zsh;

  networking.hostName = "wsl";

  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
