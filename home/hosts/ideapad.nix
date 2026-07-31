{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    inputs.sops-nix.homeManagerModules.sops
    inputs.niri-flake.homeModules.niri

    ../modules/graphical/waybar
    ../modules/graphical/cliphist.nix
    ../modules/graphical/dunst.nix
    ../modules/graphical/firefox.nix
    ../modules/graphical/fonts.nix
    ../modules/graphical/niri.nix
    ../modules/graphical/swayidle.nix
    ../modules/graphical/swaylock.nix
    ../modules/graphical/hyprshot-save.nix
    ../modules/graphical/kitty.nix
    ../modules/graphical/powermenu.nix
    ../modules/graphical/tofi.nix
    ../modules/graphical/udiskie.nix
    ../modules/graphical/xdg.nix
  ]  ++ (
    let
      modulesPath = ../modules;
      cliModules = builtins.attrNames (builtins.readDir (modulesPath + "/cli/"));
    in
      map (module: modulesPath + "/cli/${module}") cliModules
  );
  home = {
    username = "toast";
    homeDirectory = "/home/toast";
    stateVersion = "24.11";
  };

  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = "sd-switch";
}
