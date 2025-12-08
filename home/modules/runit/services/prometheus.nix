{ pkgs, config, ... }:

{
  home.file.".config/prometheus/prometheus.yml".text = ''
    global:
      scrape_interval: 1m
    
    scrape_configs:
      - job_name: 'restic_rest_server'
        static_configs:
          - targets: ['${config.runit.services.restic-rest-server.environment.LISTEN_ADDR}']
  '';

  runit.services.prometheus = {
    script = ''
      TSDB_PATH=$HOME/services/prometheus
      mkdir -p TSDB_PATH

      exec ${pkgs.prometheus}/bin/prometheus \
        --config.file=$HOME/.config/prometheus/prometheus.yml \
        --storage.tsdb.path=$TSDB_PATH \
        --web.listen-address="127.0.0.1:9090"
    '';
  };
}
