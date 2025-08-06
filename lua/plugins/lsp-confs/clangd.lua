return function(capabilities)
	local lspconfig = require("lspconfig")

	lspconfig.clangd.setup({
		capabilities = capabilities,
		cmd = {
			"clangd",
			"--header-insertion-decorators=0",
			"--background-index",
			"--clang-tidy",
			"--completion-style=detailed",
		},
		filetypes = { "c", "cpp", "h", "hpp", "cc" },
		init_options = {
			fallbackFlags = {},
		},
	})
end
