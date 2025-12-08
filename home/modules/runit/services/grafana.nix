{ pkgs, config, ... }:

{
  runit.services.grafana = {
    script = ''
      HOME_PATH=$HOME/services/grafana
      mkdir -p "$HOME_PATH"

      exec ${pkgs.grafana}/bin/grafana server \
        --homepath ${pkgs.grafana}/share/grafana
    '';

    environment = {
      GF_SERVER_HTTP_ADDR = "127.0.0.1";
      GF_SERVER_HTTP_PORT = "3000";
      GF_PATHS_DATA = "${config.home.homeDirectory}/services/grafana";
    };

    log.enable = true;
  };
}
