{ inputs, ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops

    ./modules/boot.nix
    ./modules/network.nix
    ./modules/users.nix
    ./modules/filesystem.nix

    ../../modules/common
    ../../modules/server/forgejo.nix
    ../../modules/server/openssh.nix
    ../../modules/server/restic-rest-server.nix
    ../../modules/server/trilium-server.nix
    ../../modules/server/vaultwarden.nix
    ../../modules/server/zipline.nix
    ./modules/services/tailscale.nix
    ./modules/services/restic.nix
    ./modules/services/caddy.nix
  ];
  
  system.stateVersion = "23.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
