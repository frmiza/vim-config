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
			preselect = "none",
			documentation = {
				auto_show = true,
			},
		},
	},
}

-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	version = false, -- last release is way too old
-- 	event = "InsertEnter",
-- 	dependencies = {
-- 		"hrsh7th/cmp-nvim-lsp",
-- 		"hrsh7th/cmp-buffer",
-- 		"hrsh7th/cmp-path",
-- 	},
--
-- 	opts = function()
-- 		local cmp = require("cmp")
--
-- 		local check_backspace = function()
-- 			local col = vim.fn.col(".") - 1
-- 			return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
-- 		end
--
-- 		cmp.setup({
-- 			mapping = {
-- 				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
-- 				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
-- 				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
-- 				-- '<C-y>' = cmp.config.disable, -- Especifique `cmp.config.disable` se quiser remover o mapeamento padrão `<C-y>`.
-- 				["<C-e>"] = cmp.mapping({
-- 					i = cmp.mapping.abort(),
-- 					c = cmp.mapping.close(),
-- 				}),
-- 				["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 				["<Tab>"] = cmp.mapping(function(fallback)
-- 					if cmp.visible() then
-- 						cmp.select_next_item()
-- 					elseif check_backspace() then
-- 						fallback()
-- 					else
-- 						fallback()
-- 					end
-- 				end, {
-- 					"i",
-- 					"s",
-- 				}),
-- 				["<S-Tab>"] = cmp.mapping(function(fallback)
-- 					if cmp.visible() then
-- 						cmp.select_prev_item()
-- 					else
-- 						fallback()
-- 					end
-- 				end, {
-- 					"i",
-- 					"s",
-- 				}),
-- 			},
--
-- 			sources = cmp.config.sources({
-- 				{ name = "nvim_lsp" },
-- 				{ name = "buffer" },
-- 				{ name = "path" },
-- 			}),
--
-- 			confirm_opts = {
-- 				behavior = cmp.ConfirmBehavior.Replace,
-- 				select = false,
-- 			},
--
-- 			window = {
-- 				completion = cmp.config.window.bordered(),
-- 				documentation = cmp.config.window.bordered(),
-- 			},
--
-- 			experimental = {
-- 				ghost_text = false,
-- 				native_menu = false,
-- 			},
-- 		})
-- 	end,
-- }
