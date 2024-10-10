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
    victoria-logs-src = {
      # NOTE(zaphar) this should be kept in sync with the package version below.
      url = "github:VictoriaMetrics/VictoriaMetrics/v0.34.0-victorialogs";
      flake = false;
    };
    ionide-nvim-src = {
      url = "github:ionide/ionide-vim";
      flake = false;
    };
    zig-src = {
      url = "github:ziglang/zig/0.13.0";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    nurl-flake,
    nil-flake,
    neogit-src,
    d2-vim-src,
    treesitter-context,
    roslyn-lsp,
    victoria-logs-src,
    ionide-nvim-src,
    zig-src,
  }: flake-utils.lib.eachDefaultSystem (system: let
    pkgs = import nixpkgs { inherit system; };
    nurl = nurl-flake.packages."${system}".default;
    nil = nil-flake.packages."${system}".default;
    quint = (pkgs.callPackage ./packages/quint/default.nix {})."@informalsystems/quint";
    quint-lsp = (pkgs.callPackage ./packages/quint/default.nix {})."@informalsystems/quint-language-server";
    victoria-logs = pkgs.callPackage ./packages/victoria-logs/default.nix {
        src = victoria-logs-src;
        # NOTE(zaphar) this should be kept in sync with the flake input above.
        version = "0.34.0-victorialogs";
    };
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
    ionide-nvim = pkgs.vimUtils.buildVimPlugin {
        name = "ionide-vim";
        src = ionide-nvim-src;
    };
    ziglang = pkgs.callPackage ./packages/ziglang/default.nix {
      src = zig-src;
      version = "0.13.0";
    };
  in {

    packages = {
        inherit quint quint-lsp victoria-logs neogit-nvim d2-vim nvim-treesitter-context roslyn-nvim ionide-nvim ziglang;
    };

    devShell = pkgs.mkShell {
        buildInputs = [
            nurl
            nil
            pkgs.node2nix
        ];
    };
  });
}
