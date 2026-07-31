{ pkgs, ... }:

{
  programs.niri = {
    enable = true;
    useNautilus = false;
  };

  programs.xwayland.enable = true;
  environment.systemPackages = [ pkgs.xwayland-satellite ];

  services.gnome.gnome-keyring.enable = false;
}
