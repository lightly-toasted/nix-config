#!/usr/bin/env -S just --justfile


default:
  @just --list

_check-nh:
  @command -v nh > /dev/null 2>&1 || echo "nh is not in PATH. Run 'nix develop' first."

deploy HOST=`hostname`: _check-nh
  if [ "{{HOST}}" = "$(hostname)" ]; then \
    nh os switch .; \
  else \
    nh os switch . -H {{HOST}} --target-host root@{{HOST}}; \
  fi

home: _check-nh
  nh home switch .

update:
  nix flake update --commit-lock-file

gc: _check-nh
  nh clean all --keep-since 7d
