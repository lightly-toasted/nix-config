#!/usr/bin/env -S just --justfile

default:
  @just --list

deploy-nixos:
  sudo nixos-rebuild switch --flake .#$(hostname)

deploy-vps:
  nixos-rebuild switch --flake .#vps --target-host root@vps

deploy-home:
  home-manager switch --flake .#$USER@$(hostname)

update:
  nix flake update --commit-lock-file

gc:
  nix-collect-garbage -d
  nix-collect-garbage --delete-older-than 7d
  nix-store --gc
