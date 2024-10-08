{
  description = "A very basic flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs";
    nurl-flake.url = "github:nix-community/nurl";
    nil-flake = {
      url = "github:oxalica/nil";
    };
    neogit-src = {
        url = "github:NeogitOrg/neogit";
        flake = false;
    };
    d2-vim-src = {
        url = "github:terrastruct/d2-vim";
        flake = false;
    };
    treesitter-context = {
        url = "github:nvim-treesitter/nvim-treesitter-context/e6b743ccd4e780bc9cd85b707de67df72eea1a23";
        flake = false;
    };
    roslyn-lsp = {
        url = "github:zaphar/roslyn.nvim/main";
        flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, nurl-flake, nil-flake, neogit-src, d2-vim-src, treesitter-context, roslyn-lsp }:
  flake-utils.lib.eachDefaultSystem (system: let
    pkgs = import nixpkgs { inherit system; };
    nurl = nurl-flake.packages."${system}".default;
    nil = nil-flake.packages."${system}".default;
    quint = (pkgs.callPackage ./packages/quint/default.nix {})."@informalsystems/quint";
    quint-lsp = (pkgs.callPackage ./packages/quint/default.nix {})."@informalsystems/quint-language-server";
  in {

    # TODO(zaphar): Add quint package
    packages = {
        quint = quint;
        quint-lsp = quint-lsp;
        neogit-nvim = pkgs.vimUtils.buildVimPlugin {
          pname = "neogit";
          version = "2024-05-16";
          src = neogit-src;
        };
        d2-vim =  pkgs.vimUtils.buildVimPlugin {
          pname = "d2-nvim";
          version = "2024-01-28";
          src = d2-vim-src;
        };
        nvim-treesitter-context = pkgs.vimUtils.buildVimPlugin {
            name = "nvim-treesitter-context";
            src = treesitter-context;
        };
        roslyn-nvim = pkgs.vimUtils.buildVimPlugin {
            name = "roslyn-nvim";
            src = roslyn-lsp;
        };
    };

    devShell = pkgs.mkShell {
        buildInputs = [
            nurl
            nil
        ];
    };
  });
}
