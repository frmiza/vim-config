-- Another icons  
vim.fn.sign_define("LspDiagnosticSignError", {
  texthl = "LspDiagnosticSignError",
  text = "",
  numhl = "LspDiagnosticSignError"
})

-- Another icons      
vim.fn.sign_define("LspDiagnosticSignWarning", {
  texthl = "LspDiagnosticSignWarning",
  text = "",
  numhl = "LspDiagnosticSignWarning"
})

-- Another icons      
vim.fn.sign_define("LspDiagnosticSignInformation", {
  texthl = "LspDiagnosticSignInformation",
  text = "",
  numhl = "LspDiagnosticSignInformation"
})

-- Another icons   
vim.fn.sign_define("LspDiagnosticSignHint", {
  texthl = "LspDiagnosticSignHint",
  text = "",
  numhl = "LspDiagnosticSignHint"
})
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--local servers = { 'pyright', 'tsserver' }
  --for _, lsp in ipairs(servers) do
--  nvim_lsp[lsp].setup {
--    on_attach = on_attach,
--  }
