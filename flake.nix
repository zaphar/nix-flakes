{
  description = "Zaphar's collection of useful custom flakes.";

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
    hunk-nvim-src = {
      url = "github:julienvincent/hunk.nvim";
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
    tree-sitter-cli-src = {
      url = "github:tree-sitter/tree-sitter";
      flake = false;
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay?ref=stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    naersk.url = "github:nix-community/naersk";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    nurl-flake,
    nil-flake,
    neogit-src,
    d2-vim-src,
    hunk-nvim-src,
    treesitter-context,
    roslyn-lsp,
    victoria-logs-src,
    ionide-nvim-src,
    zig-src,
    tree-sitter-cli-src,
    rust-overlay,
    naersk,
  }: flake-utils.lib.eachDefaultSystem (system: let
    tree-sitter-dsl-typings = "${tree-sitter-cli-src}/cli/npm/dsl.d.ts";
    overlays = [
      rust-overlay.overlays.default
    ];
    pkgs = import nixpkgs { inherit system overlays; };
    nurl = nurl-flake.packages."${system}".default;
    nil = nil-flake.packages."${system}".default;
    quint = (pkgs.callPackage ./packages/npm/default.nix {})."@informalsystems/quint";
    quint-lsp = (pkgs.callPackage ./packages/npm/default.nix {})."@informalsystems/quint-language-server";
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
    hunk-nvim = pkgs.vimUtils.buildVimPlugin {
      pname = "hunk-nvim";
      version = "1.5.0";
      src = hunk-nvim-src;
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
    rust-bin = pkgs.rust-bin.stable."1.81.0".default;
    naersk-lib = pkgs.callPackage naersk {
        rustc = rust-bin;
        cargo = rust-bin;
    };
    tree-sitter-cli = naersk-lib.buildPackage {
      src = tree-sitter-cli-src;
      root = tree-sitter-cli-src;
    };
    createTreeSitterTypings = pkgs.writeShellScript "createTreeSitterTypings.sh" ''
      cat ${tree-sitter-dsl-typings} > dsl.d.ts
    '';
  in {
    files = {
      inherit tree-sitter-dsl-typings;
    };
    packages = {
        inherit quint quint-lsp victoria-logs neogit-nvim d2-vim hunk-nvim nvim-treesitter-context roslyn-nvim ionide-nvim ziglang tree-sitter-cli createTreeSitterTypings;
    };

    templates = {
      base-rust = {
        path = ./templates/base-rust;
      };
    };

    devShell = pkgs.mkShell {
        buildInputs = [
            nurl
            nil
            pkgs.node2nix
        ];
    };
  }) // {
    templates = {
      base-rust = {
        path = ./templates/base-rust;
        description = "A basic rust nix template";
      };
      base-quint = {
        path = ./templates/base-quint;
        description = "A basic quint nix template";
      };
      basic-flake = {
        path = ./templates/basic-flake;
        description = "A basic nix flake template";
      };
    };
  };
}
