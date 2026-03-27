build: build-tree-sitter-cli victoria languages nvim build-claude-code build-opencode build-wasm-bindgen

nvim: build-neogit-nvim build-d2-vim build-nvim-treesitter-context build-roslyn-nvim build-ionide-nvim build-hunk-nvim build-claude-code-nvim

languages: build-quint build-quint-lsp

victoria: build-victoria-logs build-victoria-metrics

update-input-%:
	nix flake update $*

build-%:
	nix build ".#$*"

update-npm-%:
	cd packages/npm/$*; node2nix -18 -i node-packages.json

update-npm: update-npm-quint update-npm-mcp-hub update-npm-notion-mcp-server update-npm-claude-code

generate-lua-json5-lockfile:
	rm -rf /tmp/lua-json5-clone
	git clone https://github.com/Joakker/lua-json5.git /tmp/lua-json5-clone
	cd /tmp/lua-json5-clone && nix run nixpkgs#cargo -- generate-lockfile
	cp /tmp/lua-json5-clone/Cargo.lock packages/lua-json5/
	rm -rf /tmp/lua-json5-clone

