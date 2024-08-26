{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.ruby_3_3
    pkgs.libyaml
    pkgs.postgresql
    pkgs.nodejs
  ];
}
