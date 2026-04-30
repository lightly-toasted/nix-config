{ inputs, ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops

    ./modules/boot.nix
    ./modules/network.nix
    ./modules/users.nix

    ../../modules/core/filesystem.nix
    ../../modules/core/sops.nix
    ../../modules/services/tailscale.nix
    ../../modules/services/caddy.nix
    ../../modules/services/forgejo.nix
    ../../modules/services/openssh.nix
    ../../modules/services/restic-rest-server.nix
    ../../modules/services/trilium-server.nix
    ../../modules/services/vaultwarden.nix
    ../../modules/services/zipline.nix
    ./modules/services/tailscale.nix
    ./modules/services/restic.nix
  ];
  
  system.stateVersion = "23.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
