return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    scroll = {
      animate = {
        duration = { step = 25, total = 300 },
        easing = "linear",
      }
    },

    indent = {
      enabled = true,
      char = "│",
      only_scope = false,
      only_current = false,
    },

    bigfile = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    input = { enabled = false },
    picker = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  }
}
