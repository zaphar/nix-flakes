{
  inputs = {
    custom-flakes.url = "github:zaphar/nix-flakes";
    flake-utils.url = "github:numtide/flake-utils";
    #sc-flake.url = "github:mraethel/supercollider.nix";
  };

  outputs = {
      nixpkgs,
      custom-flakes,
      flake-utils,
      #sc-flake,
      ... }:
    flake-utils.lib.eachDefaultSystem (system: let
         pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (final: prev: with pkgs.stdenv; {
              supercollider = prev.supercollider.overrideAttrs(oldAttrs: {
                # allow this to runs on any unix platform not just linux
                meta.platforms = pkgs.lib.platforms.unix;
                # we need the QT5::MacExtras libs to link against
                buildInputs = oldAttrs.buildInputs ++ (if hostPlatform.isDarwin then [ prev.libsForQt5.qt5.qtmacextras ] else []);
                ## TODO(jwall): FIX the `no template named unary_function in namespace std; did you mean __unary_function` error
              });
            })
          ];
         };
         #our-supercollider = sc-flake.packages.${system}.supercollider-with-superdirt;
         #sclang-superdirt = sc-flake.packages.${system}.sclang-with-superdirt;
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            vimPlugins.scnvim
            vimPlugins.nvim-treesitter-parsers.supercollider
            neovim
            supercollider
            #our-supercollider
          ];
        };
      });
}
