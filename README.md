# nix-flakes
A collection of nix flakes

## Packages

### Languages & Tools
* quint - [quint-lang.org](https://quint-lang.org)
* quint-lsp - language server for quint
* claude-code - Anthropic's Claude Code CLI
* mcp-hub - MCP server hub
* notion-mcp-server - Notion MCP server
* tree-sitter-cli - tree-sitter CLI tool
* opencode - OpenCode AI tool
* wasm-bindgen - wasm-bindgen CLI tool
* helix-db - Helix database tool
* victoria-logs - log aggregator and query server
* victoria-metrics - metrics server

### Neovim Plugins
* neogit-nvim - git interface for neovim
* d2-vim - vim plugin for [d2lang.com](https://d2lang.com)
* nvim-treesitter-context - treesitter context plugin
* roslyn-nvim - Roslyn LSP for neovim
* ionide-nvim - Ionide F# plugin for neovim
* hunk-nvim - diff hunk viewer
* claude-code-nvim - Claude Code integration for neovim
* avante-nvim - AI assistant plugin for neovim
* lua-json5-nvim - JSON5 support for neovim

## Updating NPM Packages

NPM packages are split into independent groups under `packages/npm/`. Each can be updated individually:

```bash
make update-npm-quint            # quint + quint-language-server
make update-npm-mcp-hub          # mcp-hub
make update-npm-notion-mcp-server # notion-mcp-server
make update-npm-claude-code      # claude-code
make update-npm                  # update all
```

## Building

```bash
make build-<package-name>  # Build a specific package
make build                 # Build default set
make nvim                  # Build all Neovim plugins
make languages             # Build quint, quint-lsp
make victoria              # Build victoria-logs and victoria-metrics
```
