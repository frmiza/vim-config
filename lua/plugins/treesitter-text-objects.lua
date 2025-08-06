return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("nvim-treesitter.configs").setup({

			textobjects = {
				select = {
					enable = true,

					lookahead = true,

					keymaps = {
						["af"] = {
							query = "@function.outer",
							desc = "Select outer part of a function region (Visual Mode)",
						},
						["if"] = {
							query = "@function.inner",
							desc = "Select inner part of a function region (Visual Mode)",
						},
						["ac"] = { query = "@class.outer", desc = "Select outer part of a class region (Visual Mode)" },
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region (Visual Mode)" },
						["ai"] = {
							query = "@conditional.outer",
							desc = "Select outer part of a conditional region (Visual Mode)",
						},
						["ii"] = {
							query = "@conditional.inner",
							desc = "Select inner part of a conditional region (Visual Mode)",
						},
						["al"] = { query = "@loop.outer", desc = "Select outer part of a loop region (Visual Mode)" },
						["il"] = { query = "@loop.inner", desc = "Select inner part of a loop region (Visual Mode)" },
						["as"] = {
							query = "@local.scope",
							query_group = "locals",
							desc = "Select language scope (Visual Mode)",
						},
					},
					include_surrounding_whitespace = true,
				},
				move = {
					enable = true,

					set_jumps = true,

					goto_next_start = {
						["nf"] = { query = "@function.outer", desc = "Next function start (Visual Mode)" },
						["nc"] = { query = "@class.outer", desc = "Next class start (Visual Mode)" },
						["ni"] = { query = "@conditional.outer", desc = "Next conditional start (Visual Mode)" },
						["nl"] = { query = "@loop.outer", desc = "Next loop start (Visual Mode)" },
					},
					goto_previous_start = {
						["pf"] = { query = "@function.outer", desc = "Previous function start (Visual Mode)" },
						["pc"] = { query = "@class.outer", desc = "Previous class start (Visual Mode)" },
						["pi"] = { query = "@conditional.outer", desc = "Previuos conditional start (Visual Mode)" },
						["pl"] = { query = "@loop.outer", desc = "Previous loop start (Visual Mode)" },
					},
				},
			},
		})

		local keymap = vim.keymap.set
		keymap("n", "af", "vaf", { desc = "Select outer function (Normal mode)" })
		keymap("n", "if", "vif", { desc = "Select inner function (Normal mode)" })
		keymap("n", "ac", "vac", { desc = "Select outer class (Normal mode)" })
		keymap("n", "ic", "vic", { desc = "Select inner class (Normal mode)" })
		keymap("n", "ai", "vai", { desc = "Select outer conditional (Normal mode)" })
		keymap("n", "ii", "vii", { desc = "Select inner conditional (Normal mode)" })
		keymap("n", "al", "val", { desc = "Select outer loop (Normal mode)" })
		keymap("n", "il", "vil", { desc = "Select inner loop (Normal mode)" })
		keymap("n", "as", "vas", { desc = "Select local scope (Normal mode)" })
	end,
}
