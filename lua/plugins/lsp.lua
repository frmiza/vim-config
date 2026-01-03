return {
	event = { "BufReadPre", "BufNewFile" },
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", require("fzf-lua").lsp_definitions, "[G]oto [D]efinition")

				map("gr", require("fzf-lua").lsp_references, "[G]oto [R]eferences")

				map("gI", require("fzf-lua").lsp_implementations, "[G]oto [I]mplementation")

				map("<leader>D", require("fzf-lua").lsp_typedefs, "Type [D]efinition")

				map("<leader>ds", require("fzf-lua").lsp_document_symbols, "[D]ocument [S]ymbols")

				map("<leader>ws", require("fzf-lua").lsp_live_workspace_symbols, "[W]orkspace [S]ymbols")

				map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")

				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			end,
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		-- vim.lsp.config("lua_ls", {
		-- 	settings = {
		-- 		Lua = {
		-- 			-- make the language server recognize "vim" global
		-- 			diagnostics = {
		-- 				globals = { "vim" },
		-- 			},
		-- 			completion = {
		-- 				callSnippet = "Replace",
		-- 			},
		-- 		},
		-- 	},
		-- })
		require("plugins.lsp-confs.luals")(capabilities)
		require("plugins.lsp-confs.clangd")(capabilities)
		require("plugins.lsp-confs.wolfram")(capabilities)
	end,
}
