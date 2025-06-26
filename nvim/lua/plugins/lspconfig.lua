return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "hrsh7th/nvim-cmp" },
  },
  config = function()
    local lsp = require("plugins.lsp.utils")
    lsp.setup()
    local capabilities = lsp.capabilities()

    local lspconfig = require("lspconfig")

    require("plugins.lsp.servers.clangd")(capabilities)
    require("plugins.lsp.servers.pyright")(capabilities)
    --require("plugins.lsp.servers.tsserver")(capabilities)
  end,
}
