{
  inputs = {
    custom-flakes.url = "github:zaphar/nix-flakes";
    flake-utils = {url = "github:numtide/flake-utils"; };
  };

  outputs = { nixpkgs, custom-flakes, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: let
         pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.gnumake
          ];
        };
      });
}
