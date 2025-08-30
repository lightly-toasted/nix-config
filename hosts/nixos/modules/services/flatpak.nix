{ config, pkgs, ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
      "org.vinegarhq.Vinegar"
      "com.spotify.Client"
    ];
    overrides = {
      "org.vinegarhq.Sober".Context = {
        filesystems = [
          "xdg-run/app/com.discordapp.Discord:create"
          "xdg-run/discord-ipc-0"
        ];
      };
    };
  };
}
