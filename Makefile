build: build-quint build-quint-lsp build-neogit-nvim build-d2-vim build-nvim-treesitter-context build-roslyn-nvim build-victoria-logs

build-%:
	nix build ".#$*"

update-quint:
	#curl -L https://raw.githubusercontent.com/informalsystems/quint/$*/quint/package.json > nix/packages/quint/package.json 
	#curl -L https://raw.githubusercontent.com/informalsystems/quint/$*/quint/package-lock.json > nix/packages/quint/package-lock.json
	node2nix -18 -i node-packages.json
	#pactch the default.nix
	#sed -e 's#inherit nodeEnv;#inherit nodeEnv quint-src;#' -e 's/, system/, quint-src, system/' -i '' nix/packages/quint/default.nix
	#sed -e 's#src = \./\.#src = "$${quint-src}/quint"#' -e 's#nodeEnv, #quint-src, nodeEnv, #' -i '' nix/packages/quint/node-packages.nix
	#rm -f nix/packages/quint/package*.json

