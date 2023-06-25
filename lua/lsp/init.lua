local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lsp.handler").setup()
require("lsp.null-ls")
require("lsp.settings.pyright")
require("lsp.settings.js-ts")
require("lsp.settings.clang")
