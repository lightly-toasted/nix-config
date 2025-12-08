{ pkgs, ... }:

{
  runit.services.restic-rest-server = {
    script = ''
      DATA_DIR=$HOME/services/restic-rest-server
      mkdir -p "$DATA_DIR"

      exec ${pkgs.restic-rest-server}/bin/rest-server \
        --listen "$LISTEN_ADDR" \
        --log - \
        --no-auth \
        --path $DATA_DIR \
        --prometheus --prometheus-no-auth
    '';

    environment = {
      LISTEN_ADDR = "127.0.0.1:9000";
    };
  };
}
