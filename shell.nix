{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nix
    home-manager
    git
    sops
    git-crypt
  ];
}
