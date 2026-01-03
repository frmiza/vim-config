-- ~/.config/nvim/lua/plugins/lsp_confs/luals.lua
return function(capabilities)

  vim.lsp.config['lua_ls'] = {
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
	}
end
