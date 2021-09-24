vim.fn.sign_define("LspDiagnosticSignError", {
  texthl = "LspDiagnosticSignError",
  text = "X",
  numhl = "LspDiagnosticSignError"
})

vim.fn.sign_define("LspDiagnosticSignWarning", {
  texthl = "LspDiagnosticSignWarning",
  text = "A",
  numhl = "LspDiagnosticSignWarning"
})

vim.fn.sign_define("LspDiagnosticSignInformation", {
  texthl = "LspDiagnosticSignInformation",
  text = "i",
  numhl = "LspDiagnosticSignInformation"
})

vim.fn.sign_define("LspDiagnosticSignHint", {
  texthl = "LspDiagnosticSignHint",
  text = "H",
  numhl = "LspDiagnosticSignHint"
})

local nvim_lsp = require('lspconfig')
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--local servers = { 'pyright', 'tsserver' }
--for _, lsp in ipairs(servers) do
--  nvim_lsp[lsp].setup {
--    on_attach = on_attach,
--  }
