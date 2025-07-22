{
    inputs = {
      nixpkgs.url = "nixpkgs";
      flake-utils = {url = "github:numtide/flake-utils"; };
      julia2nix-flake = {
        url = "github:codedownio/julia2nix/v1.0.0";
        flake = false;
      };
    };
    outputs = {nixpkgs, flake-utils, julia2nix-flake, ...}: 
    flake-utils.lib.eachDefaultSystem (system: let
         pkgs = import nixpkgs { inherit system; };
         # NOTE(zaphar): We only need to do this because the flake in the repo only handles x86_64 systems and doesn't use the julia-lts package
         julia2nix = import ../../packages/julia2nix/default.nix { src = julia2nix-flake; inherit pkgs; };
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            gnumake
            julia-lts
            julia2nix
          ];
        };
      });
}
