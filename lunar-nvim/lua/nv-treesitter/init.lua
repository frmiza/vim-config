require('nvim-treesitter.configs').setup{
  ensure_intalled = "all",
  highlight = {
    enable = true,              -- false will disable the whole extension
  },

  playground = {
    enable = true,
    disable = {},
    uptime = 25,
    persist_queries =  false
  },

  rainbow = { enable = false }

}
