require('nvim-treesitter.configs').setup{
  ensure_intalled = {"html", "javascript", "typescript", "python", "c", "lua", "rust"},
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
--
--  playground = {
--    enable = true,
--    disable = {},
--    uptime = 25,
--    persist_queries =  false
--  },

--rainbow = { enable = false }

}
