local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

return function(capabilities)

  if not configs.lsp_wl then
    configs.lsp_wl = {
      default_config = {
        cmd = {
          "wolfram",
          "kernel",
          "-noinit",
          "-noprompt",
          "-nopaclet",
          "-noicon",
          "-nostartuppaclets",
          "-run",
          'Needs["LSPServer`"];LSPServer`StartServer[]',
        },
        filetypes = { "mma", "wl" },
        root_dir = lspconfig.util.path.dirname,
      },
    }
  end

  lspconfig.lsp_wl.setup({
    capabilities = capabilities,
  })
end
