{ rootPath, ... }:

{
  sops.defaultSopsFile = rootPath + /secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/toast/.config/sops/age/keys.txt";
}
