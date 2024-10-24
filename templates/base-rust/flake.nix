{
  inputs = {
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    naersk.url = "github:nix-community/naersk";
    flake-utils = {url = "github:numtide/flake-utils"; };
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
 
  };

  outputs = {self, nixpkgs, flake-utils, rust-overlay, naersk, flake-compat}:
  flake-utils.lib.eachDefaultSystem (system: let
    overlays = [
      rust-overlay.overlays.default
    ];
    pkgs = import nixpkgs { inherit system overlays; };
    rust-bin = pkgs.rust-bin.stable.latest.default;
    naersk-lib = pkgs.callPackage naersk {
        rustc = rust-bin;
        cargo = rust-bin;
    };
    project = naersk-lib.buildPackage {
    	src = ./.;
      root = ./.;
      nativeBuildInputs = [pkgs.pkg-config];
      buildInputs =
        (
          if pkgs.stdenv.isDarwin
          then with pkgs.darwin.apple_sdk.frameworks; [Security SystemConfiguration]
          else [pkgs.openssl]
        )
        ++ [rust-bin];
    };
  in
  {
    packages.default = project;
    devShells.default = pkgs.mkShell {
      buildInputs = [ rust-bin pkgs.rust-analyzer ];
      packages = with pkgs; [ gnumake ];
    };
  });
}
