# nix-config
My personal NixOS and home-manager configurations.

## Hosts
- `nixos`: My main computer.
- `vps`: 2GB KVM VPS server on [RackNerd](https://www.racknerd.com/), installed with NixOS using [nixos-infect](https://github.com/elitak/nixos-infect).
- `wsl`: NixOS on WSL via [NixOS-WSL](https://github.com/nix-community/NixOS-WSL).
- `y2q`: Spare Galaxy S20+ phone, repurposed as a Ubuntu server using [chroot-distro](https://github.com/Magisk-Modules-Alt-Repo/chroot-distro).

## Deploy
```sh
nix develop

deploy-nixos # Rebuild and switch the current NixOS system on this host
deploy-home # Apply Home Manager configuration for the current user
deploy-vps # Rebuild and switch NixOS on the remote VPS
```

