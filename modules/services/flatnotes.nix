{ config, ... }:

{
  sops.secrets.flatnotes_env = {};
  virtualisation.oci-containers.containers.flatnotes = {
    image = "dullage/flatnotes:latest";
    ports = ["3001:8080"];
    volumes = ["/var/lib/flatnotes:/data"];
    environmentFiles = [ config.sops.secrets."flatnotes_env".path ];
  };
}
