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
    ionide-nvim-src = {
      url = "github:ionide/ionide-vim";
      flake = false;
    };
    claude-code-nvim-src = {
      url = "github:greggh/claude-code.nvim";
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
    opencode-src = {
      url = "https://registry.npmjs.org/opencode-ai/-/opencode-ai-0.2.5.tgz";
      flake = false;
    };
    opencode-platform-linux-amd64-src = {
      url = "https://registry.npmjs.org/opencode-darwin-x64/-/opencode-darwin-x64-0.2.5.tgz";
      flake = false;
    };
    opencode-platform-darwin-arm64-src = {
      url = "https://registry.npmjs.org/opencode-darwin-arm64/-/opencode-darwin-arm64-0.2.5.tgz";
      flake = false;
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay?ref=stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    naersk.url = "github:nix-community/naersk";
    gomod2nix-src.url = "github:nix-community/gomod2nix";
    avante-src = {
      url = "github:yetone/avante.nvim";
      flake = false;
    };
    lua-json5-src = {
      url = "github:Joakker/lua-json5";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    nurl-flake,
    nil-flake,
    gomod2nix-src,
    neogit-src,
    d2-vim-src,
    hunk-nvim-src,
    treesitter-context,
    roslyn-lsp,
    ionide-nvim-src,
    claude-code-nvim-src,
    zig-src,
    tree-sitter-cli-src,
    rust-overlay,
    naersk,
    avante-src,
    lua-json5-src,
    opencode-src,
    opencode-platform-linux-amd64-src,
    opencode-platform-darwin-arm64-src
  }: flake-utils.lib.eachDefaultSystem (system: let
    tree-sitter-dsl-typings = "${tree-sitter-cli-src}/cli/npm/dsl.d.ts";
    overlays = [
      rust-overlay.overlays.default
    ];
    pkgs = import nixpkgs { inherit system overlays; };
    opencode = (pkgs.callPackage ./packages/opencode-ai/default.nix {
      src = opencode-src;
      platformLinuxSrc = opencode-platform-linux-amd64-src;
      platformDarwinSrc = opencode-platform-darwin-arm64-src;
      version = "v0.2.5";
      inherit system pkgs;
    }).opencode;
    avante-nvim-lib = pkgs.rustPlatform.buildRustPackage {
      pname = "avante-nvim-lib";
      src = avante-src;
      version = "2025-05-07";

      cargoHash = "sha256-pmnMoNdaIR0i+4kwW3cf01vDQo39QakTCEG9AXA86ck=";

      nativeBuildInputs = [
        pkgs.pkg-config
      ];
      
      useFetchCargoVendor = true;

      buildInputs = [
        pkgs.openssl
      ];

      buildFeatures = [ "lua51" ];

      checkFlags = [
        # Disabled because they access the network.
        "--skip=test_hf"
        "--skip=test_public_url"
        "--skip=test_roundtrip"
        "--skip=test_fetch_md"
      ];
    };
    avante-nvim = pkgs.vimUtils.buildVimPlugin {
      pname = "avante-nvim";
      version = "2025-03-24";
      src = avante-src;
      doCheck = false;
      dependencies = with pkgs.vimPlugins; [
            plenary-nvim
            nui-nvim
            nvim-treesitter
            dressing-nvim
      ];
      postInstall =
        let
          ext = pkgs.stdenv.hostPlatform.extensions.sharedLibrary;
        in
        ''
          mkdir -p $out/build
          cp ${avante-nvim-lib}/lib/libavante_repo_map${ext} $out/build/avante_repo_map${ext}
          cp ${avante-nvim-lib}/lib/libavante_templates${ext} $out/build/avante_templates${ext}
          cp ${avante-nvim-lib}/lib/libavante_tokenizers${ext} $out/build/avante_tokenizers${ext}
        '';
      doInstallCheck = true;
      nvimRequireCheck = "avante";

      meta = {
        description = "Neovim plugin designed to emulate the behaviour of the Cursor AI IDE";
        homepage = "https://github.com/yetone/avante.nvim";
        license = pkgs.lib.licenses.asl20;
        maintainers = with pkgs.lib.maintainers; [
          ttrei
          aarnphm
        ];
      };
    };
    neovim-avante = pkgs.wrapNeovim pkgs.neovim-unwrapped {
      configure = {
        packages.myPlugins = {
          start = [
            avante-nvim
          ];
        };
      };
    };
    nurl = nurl-flake.packages."${system}".default;
    nil = nil-flake.packages."${system}".default;
    gomod2nix = gomod2nix-src.packages."${system}".default;
    quint = (pkgs.callPackage ./packages/npm/default.nix {})."@informalsystems/quint";
    quint-lsp = (pkgs.callPackage ./packages/npm/default.nix {})."@informalsystems/quint-language-server";
    mcp-hub = (pkgs.callPackage ./packages/npm/default.nix {})."mcp-hub";
    claude-code = (pkgs.callPackage ./packages/npm/default.nix {})."@anthropic-ai/claude-code";
    notion-mcp-server = (pkgs.callPackage ./packages/npm/default.nix {})."@notionhq/notion-mcp-server";
    victoria-logs = pkgs.victoriametrics;
    victoria-metrics = pkgs.victoriametrics;
    neogit-nvim = pkgs.vimUtils.buildVimPlugin {
      pname = "neogit";
      version = "2025-03-24";
      src = neogit-src;
      doCheck = false;
    };
    d2-vim =  pkgs.vimUtils.buildVimPlugin {
      pname = "d2-nvim";
      version = "2024-01-28";
      src = d2-vim-src;
    };
    hunk-nvim-pkg = pkgs.vimUtils.buildVimPlugin {
      pname = "hunk-nvim";
      version = "1.5.0";
      src = hunk-nvim-src;
      doCheck = false;
    };
    hunk-nvim = pkgs.symlinkJoin {
      name = "hunk-nvim-bundle";
      paths = [ hunk-nvim-pkg pkgs.vimPlugins.nui-nvim ];
    };
    nvim-treesitter-context = pkgs.vimUtils.buildVimPlugin {
        name = "nvim-treesitter-context";
        src = treesitter-context;
    };
    roslyn-nvim = pkgs.vimUtils.buildVimPlugin {
        name = "roslyn-nvim";
        src = roslyn-lsp;
        doCheck = false;
    };
    ionide-nvim = pkgs.vimUtils.buildVimPlugin {
        name = "ionide-vim";
        src = ionide-nvim-src;
    };
    claude-code-nvim = pkgs.vimUtils.buildVimPlugin {
        name = "claude-code-vim";
        src = claude-code-nvim-src;
    };
    ziglang = pkgs.callPackage ./packages/ziglang/default.nix {
      src = zig-src;
      version = "0.13.0";
    };
    rust-bin = pkgs.rust-bin.stable."1.84.0".default;
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
    lua-json5-packages = pkgs.callPackage ./packages/lua-json5/default.nix {
      src = lua-json5-src;
    };
    lua-json5-nvim = lua-json5-packages.lua-json5-nvim;
    lua-json5-lib = lua-json5-packages.lua-json5-lib;
  in {
    files = {
      inherit tree-sitter-dsl-typings;
    };
    packages = {
        inherit
          quint
          quint-lsp
          claude-code
          victoria-logs
          victoria-metrics
          neogit-nvim
          d2-vim
          hunk-nvim
          nvim-treesitter-context
          roslyn-nvim
          ionide-nvim
          ziglang
          tree-sitter-cli
          createTreeSitterTypings
          mcp-hub
          notion-mcp-server
          avante-nvim-lib
          avante-nvim
          neovim-avante
          claude-code-nvim
          lua-json5-nvim
          lua-json5-lib
          opencode
        ;
    };

    devShell = pkgs.mkShell {
        buildInputs = [
            nurl
            nil
            gomod2nix
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
