{ pkgs, ... }:

{
  systemd.user.services.snapcast-sink = {
    wantedBy = [
      "pipewire.service"
    ];
    after = [
      "pipewire.service"
    ];
    bindsTo = [
      "pipewire.service"
    ];
    path = with pkgs; [
      pipewire
    ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      pw-cli create-node adapter '{
        factory.name=support.null-audio-sink
        node.name=Snapcast
        media.class=Audio/Sink
        object.linger=1
        audio.position=[FL,FR]
        monitor.channel-volumes=true
      }'
    '';
  };
      
  systemd.user.services.snapcast-bridge = {
    wantedBy = [ "snapcast-sink.service" ];
    after = [ "snapcast-sink.service" ];
    requires = [ "snapcast-sink.service" ];
    path = with pkgs; [ pulseaudio ];
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      RestartSec = 2;
    };
    script = ''
      while [ ! -p /run/snapserver/pipewire ]; do sleep 1; done
      parec --device=Snapcast.monitor --format=s16le --rate=44100 --channels=2 --latency=500 > /run/snapserver/pipewire
    '';
  };

  services.snapserver = {
    settings.stream.source = [
      "pipe:///run/snapserver/pipewire?name=opus&codec=opus&sampleformat=44100:16:2"
    ];
  };

  systemd.services.snapserver.serviceConfig.ExecStartPost = "${pkgs.coreutils}/bin/chmod 666 /run/snapserver/pipewire";
}
