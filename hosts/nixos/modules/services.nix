{ config, pkgs, ... }:

{
  services.xserver = {
    xkb.layout = "us";
    videoDrivers = [ "nvidia" ];
  };

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images 

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --remember-session";
       user = "greeter";
      }; 
    };
  };
  services.tailscale.enable = true;
  services.flatpak = {
    enable = true;
    packages = [
      "org.prismlauncher.PrismLauncher"
      "org.vinegarhq.Sober"
      "org.vinegarhq.Vinegar"
      "com.spotify.Client"
    ];
    overrides = {
      "org.prismlauncher.PrismLauncher".Context = {
        filesystems = [
          "home"
        ];
      };
      "org.vinegarhq.Sober".Context = {
        filesystems = [
          "xdg-run/app/com.discordapp.Discord:create"
          "xdg-run/discord-ipc-0"
        ];
      };
    };
  };
}
