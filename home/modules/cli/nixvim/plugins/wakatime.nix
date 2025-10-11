{ config, ... }:

{
  sops.secrets."wakatime" = {
    path = "${config.home.homeDirectory}/.wakatime.cfg";
  };

  programs.nixvim.plugins.wakatime = {
    enable = true;
    autoLoad = true;
  };
}
