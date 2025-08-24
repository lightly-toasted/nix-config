{ config, pkgs, ... }:

{
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
