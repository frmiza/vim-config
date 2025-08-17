return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({

			ensure_installed = {
				"bash",
				"c",
				"cmake",
				"commonlisp",
				"cpp",
				"css",
				"cuda",
				"dockerfile",
				"fennel",
				"gap",
				"haskell",
				"html",
				"javascript",
				"json",
				"lua",
				"nix",
				"python",
				"regex",
				"rust",
				"scss",
				"sxhkdrc",
				"tmux",
				"toml",
				"typescript",
				"typst",
				"yaml",
				"yuck",
				"zig",
			},

			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
				disable = {},
			},
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
		})
	end,
}
