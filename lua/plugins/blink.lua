return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	opts = {
		keymap = {
			["<C-b>"] = { "scroll_documentation_up" },
			["<C-f>"] = { "scroll_documentation_down" },
			["<C-Space>"] = { "show" },
			["<C-e>"] = { "hide" },
			["<CR>"] = { "accept", "fallback" }, -- Alteração feita aqui
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev" },
		},
		sources = {
			default = { "lsp", "buffer", "path" },
		},
		completion = {
			documentation = {
				auto_show = true,
			},
		},
	},
}
