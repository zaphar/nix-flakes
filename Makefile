build: build-quint build-quint-lsp build-neogit-nvim build-d2-vim build-nvim-treesitter-context build-roslyn-nvim

build-%:
	nix build ".#$*"
