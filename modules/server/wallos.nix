{
  sops.secrets.flatnotes_env = {};
  virtualisation.oci-containers.containers.wallos = {
    image = "bellamy/wallos:latest";
    ports = ["3002:80/tcp"];
    environment = {
      TZ = "Asia/Seoul";
    };
    volumes = [
      "/var/lib/wallos/db:/var/www/html/db"
      "/var/lib/wallos/logos:/var/www/html/images/uploads/logos"
    ];
  };
}
