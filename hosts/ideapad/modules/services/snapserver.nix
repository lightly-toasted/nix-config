{ pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    extraConfig.pipewire-pulse."40-snapcast-sink" = {
      "pulse.cmd" = [
        {
          cmd = "load-module";
          args = "module-pipe-sink file=/run/snapserver/pipewire sink_name=Snapcast format=s16le rate=48000";
        }
      ];
    };
  };
  services.snapserver = {
    settings.stream.source = [
      "pipe:///run/snapserver/pipewire?name=opus&codec=opus&sampleformat=48000:16:2"
    ];
  };
  systemd.services.snapserver.serviceConfig = {
    SupplementaryGroups = [ "audio" ];
    RuntimeDirectoryMode = "0770";
    ExecStartPost = "+${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/chown -R snapserver:audio /run/snapserver && ${pkgs.coreutils}/bin/chmod 770 /run/snapserver && ${pkgs.coreutils}/bin/chmod 660 /run/snapserver/pipewire'";
  };
}
