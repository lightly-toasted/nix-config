# nix-config
My personal NixOS and home-manager configurations.

## Hosts
- `nixos`: My main computer.
- `y2q`: Spare Galaxy S20+ phone, repurposed as a Ubuntu server using [chroot-distro](https://github.com/Magisk-Modules-Alt-Repo/chroot-distro).

## Deploy
```sh
nix develop

just deploy # Rebuild and switch the current NixOS system on this host
just deploy hostname # Rebuild and switch NixOS remotely 
just home # Apply Home Manager configuration for the current user
```

