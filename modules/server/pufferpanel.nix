{
  virtualisation.oci-containers.containers.pufferpanel = {
    image = "pufferpanel/pufferpanel:latest";
    ports = [ "8080:8080" "5657:5657" ];
    volumes = [
      "/etc/pufferpanel:/etc/pufferpanel"
      "/data/pufferpanel:/var/lib/pufferpanel"
      "/var/run/docker.sock:/var/run/docker.sock"
    ];
    autoStart = true;
  };
}
