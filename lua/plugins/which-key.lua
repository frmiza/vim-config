return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {

		preset = "modern",
		plugins = {
			marks = true,
			registers = false,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
		},

		keys = {
			scroll_down = "<C-d>",
			scroll_up = "<C-u>",
		},
	},

	keys = {
		{
			"?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
