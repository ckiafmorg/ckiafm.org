{
  description = "A rails web app to manage book loans";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs-ruby.url = "github:bobvanderlinden/nixpkgs-ruby";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      nixpkgs-ruby,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            nixpkgs-ruby.overlays.default
          ];
        };
      in
      {
        devShells = {
          default = pkgs.mkShell {
            packages = [
              pkgs."ruby-3.4"
              pkgs.libyaml
              pkgs.postgresql
              pkgs.nodejs
            ];
          };
        };
      }
    );
}
