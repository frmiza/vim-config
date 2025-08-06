-- ~/.config/nvim/lua/plugins/lsp_confs/luals.lua
return function(capabilities)
	local lspconfig = require("lspconfig")

	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				completion = {
					callSnippet = "Replace",
				},
				runtime = {
					version = "LuaJIT", -- Ou "5.1", "5.2", "5.3", "5.4" dependendo da sua versão Lua
				},
			},
		},
	})
end
