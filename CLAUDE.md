# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview
This is a Nix flakes repository containing custom packages and development templates. It packages various development tools including language servers, Neovim plugins, and programming languages.

## Version control

We use jj instead of git for version control.

**Start new commit**
```bash
jj new
```

**Fold in new progress on a commit**
```bash
jj squash
```

**Complete progress on commit**
```bash
jj commit -m'<commit message>'
```

## Common Commands

**Building packages:**
```bash
make build-<package-name>  # Build specific package (e.g., make build-quint)
nix build ".#<package-name>"  # Alternative build command
```

**Grouped builds:**
```bash
make build        # Build tree-sitter-cli, victoria tools, languages, nvim plugins, claude-code, opencode
make nvim          # Build all Neovim plugins
make languages     # Build quint, quint-lsp, ziglang
make victoria      # Build victoria-logs and victoria-metrics
```

**Update NPM packages:**
```bash
make update-npm    # Update node packages using node2nix
```

**Development shell:**
```bash
nix develop        # Enter development shell with nurl, nil, gomod2nix, node2nix
```

## Architecture

**Main flake structure:**
- `flake.nix` - Main flake definition with all package outputs
- `packages/` - Package definitions organized by type
- `templates/` - Nix flake templates for different languages/frameworks

**Package categories:**
- **Languages:** quint, ziglang, rust toolchain
- **Language servers:** quint-lsp, nil (Nix), roslyn-nvim (C#)
- **Neovim plugins:** neogit, d2-vim, treesitter-context, hunk-nvim, avante-nvim, claude-code-nvim
- **Tools:** tree-sitter-cli, victoria-logs/metrics, opencode, claude-code
- **MCP servers:** mcp-hub, notion-mcp-server

**Key package locations:**
- `packages/npm/` - Node.js packages built with node2nix
- `packages/opencode-ai/` - OpenCode AI tool packaging
- `packages/ziglang/` - Zig compiler from source

**Templates:**
- `base-rust` - Rust project template
- `base-quint` - Quint specification language template  
- `base-julia` - Julia project template
- `basic-flake` - Basic Nix flake template
- `typesetting` - Document typesetting template

All packages are built using standard Nix patterns with inputs from GitHub sources and npm registry.
