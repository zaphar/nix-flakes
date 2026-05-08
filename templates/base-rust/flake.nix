{
  inputs = {
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    crane.url = "github:ipetkov/crane";
    flake-utils = {url = "github:numtide/flake-utils"; };
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };

  };

  outputs = {nixpkgs, flake-utils, rust-overlay, crane, ...}:
  flake-utils.lib.eachDefaultSystem (system: let
    overlays = [
      rust-overlay.overlays.default
    ];
    pkgs = import nixpkgs { inherit system overlays; };
    rust-bin = pkgs.rust-bin.stable.latest.default;
    craneLib = (crane.mkLib pkgs).overrideToolchain rust-bin;
    project = craneLib.buildPackage {
      src = craneLib.cleanCargoSource ./.;
      strictDeps = true;
      nativeBuildInputs = [pkgs.pkg-config];
      buildInputs =
        (
          if pkgs.stdenv.isDarwin
          then with pkgs.darwin.apple_sdk.frameworks; [Security SystemConfiguration]
          else [pkgs.openssl]
        );
    };
  in
  {
    packages.default = project;
    devShells.default = pkgs.mkShell {
      buildInputs = [ rust-bin pkgs.rust-analyzer pkgs.cargo-tarpaulin ];
      packages = with pkgs; [ gnumake ];
    };
  });
}
