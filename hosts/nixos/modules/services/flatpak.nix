{ config, pkgs, ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
      "org.vinegarhq.Vinegar"
      "com.spotify.Client"
      "md.obsidian.Obsidian"
    ];
    overrides = {
      "org.vinegarhq.Sober".Context = {
        filesystems = [
          "xdg-run/app/com.discordapp.Discord:create"
          "xdg-run/discord-ipc-0"
        ];
      };
      "md.obsidian.Obsidian".Context = {
        filesystems = [
          "home"
          "/data/Backup/Obsidian"
        ];
      };
    };
  };
}
