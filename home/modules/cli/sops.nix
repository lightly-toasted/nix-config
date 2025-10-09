{ rootPath, config, ... }:

{
  sops.defaultSopsFile = rootPath + /secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
}
