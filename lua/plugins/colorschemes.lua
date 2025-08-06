return {
	--{
	--  "rose-pine/neovim",
	--  name = "rose-pine",
	--  config = function()
	--    vim.cmd("colorscheme rose-pine")
	--  end,
	--},
	--{
	--   "olimorris/onedarkpro.nvim",
	--   name = "onedark",
	--   config = function()
	--     vim.cmd("colorscheme onedark_dark")
	--   end,
	--},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "transparent", -- style for sidebars, see below
				floats = "transparent", -- style for floating windows
			},
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
		end,
	},
}
