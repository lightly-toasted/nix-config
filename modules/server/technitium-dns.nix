{
  sops.secrets.flatnotes_env = {};
  virtualisation.oci-containers.containers.technitium-dns = {
    image = "docker.io/technitium/dns-server:latest";
    ports = ["3004:5380/tcp" "53:53/udp" "53:53/tcp"];
    environment = {
      TZ = "Asia/Seoul";
    };
    volumes = [
      "config:/etc/dns"
      "logs:/var/log/technitium/dns"
    ];
  };
}
