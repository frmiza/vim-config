--Another icons   
vim.fn.sign_define(
  "LspDiagnosticsSignError",
  { texthl = "LspDiagnosticsSignError", text = " ", numhl = "LspDiagnosticsSignError" }
)

--Another icons     
vim.fn.sign_define(
 t"LspDiagnosticsSignWarning",
  { texthl = "LspDiagnosticsSignWarning", text = " ", numhl = "LspDiagnosticsSignWarning" }
)

--Another icons    
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  { texthl = "LspDiagnosticsSignHint", text = " ", numhl = "LspDiagnosticsSignHint" }
)

--Another icons      
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  { texthl = "LspDiagnosticsSignInformation", text = " ", numhl = "LspDiagnosticsSignInformation" }
)

-- Set Default Prefix.
-- Note: You can set a prefix per lsp server in the lv-globals.lua file
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    prefix = " ",
  },
  signs = true,
  underline = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = border,
})

