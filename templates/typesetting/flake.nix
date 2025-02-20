{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    sile-flake.url = "github:sile-typesetter/sile";
    typst-flake.url = "github:typst/typst/v0.13.0";
    flake-utils.url = "github:numtide/flake-utils";
  };
  
  outputs = {self,
    nixpkgs,
    sile-flake,
    typst-flake,
    flake-utils,
  }: flake-utils.lib.eachDefaultSystem (system:
    let
        pkgs = import nixpkgs { inherit system; };
        sile = sile-flake.defaultPackage.${system};
        typst = typst-flake.packages.${system}.default;
    in
    {
      packages.sile = sile;
      packages.typst = typst;
      packages.default = typst;
    
      apps.sile = {
        type = "app";
        program = "${sile}/bin/sile";
      };
      apps.typst = {
        type = "app";
        program = "${typst}/bin/typst";
      };
      devShell = pkgs.mkShell {
        buildInputs = [ sile typst ] ++ (with pkgs; [ tinymist gnumake ]);
      };
    });
}
