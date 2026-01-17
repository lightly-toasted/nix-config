#!/usr/bin/env -S just --justfile

default:
  @just --list

_check-nh:
  @command -v nh > /dev/null 2>&1 || echo "nh is not in PATH. Run 'nix develop' first."

nixos: _check-nh
  nh os switch .

vps: _check-nh
  nh os switch . -H vps --target-host root@vps

home: _check-nh
  nh home switch .

update:
  nix flake update --commit-lock-file

gc: _check-nh
  nh clean all --keep-since 7d
