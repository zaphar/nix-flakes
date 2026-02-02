build: build-tree-sitter-cli victoria languages nvim build-claude-code build-opencode build-wasm-bindgen

nvim: build-neogit-nvim build-d2-vim build-nvim-treesitter-context build-roslyn-nvim build-ionide-nvim build-hunk-nvim build-claude-code-nvim

languages: build-quint build-quint-lsp

victoria: build-victoria-logs build-victoria-metrics

update-input-%:
	nix flake update $*

build-%:
	nix build ".#$*"

update-npm:
	#curl -L https://raw.githubusercontent.com/informalsystems/quint/$*/quint/package.json > nix/packages/quint/package.json 
	#curl -L https://raw.githubusercontent.com/informalsystems/quint/$*/quint/package-lock.json > nix/packages/quint/package-lock.json
	cd packages/npm; node2nix -18 -i node-packages.json
	#pactch the default.nix
	#sed -e 's#inherit nodeEnv;#inherit nodeEnv quint-src;#' -e 's/, system/, quint-src, system/' -i '' nix/packages/quint/default.nix
	#sed -e 's#src = \./\.#src = "$${quint-src}/quint"#' -e 's#nodeEnv, #quint-src, nodeEnv, #' -i '' nix/packages/quint/node-packages.nix
	#rm -f nix/packages/quint/package*.json

generate-lua-json5-lockfile:
	rm -rf /tmp/lua-json5-clone
	git clone https://github.com/Joakker/lua-json5.git /tmp/lua-json5-clone
	cd /tmp/lua-json5-clone && nix run nixpkgs#cargo -- generate-lockfile
	cp /tmp/lua-json5-clone/Cargo.lock packages/lua-json5/
	rm -rf /tmp/lua-json5-clone

