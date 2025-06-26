return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "cpp",
        "cmake",
        "go",
        "json",
        "lua",
        "bash",
        "yuck",
        "css",
        "html",
        "javascript",
        "jsdoc",
        "jsonc",
        "regex",
        "scss",
        "toml",
        "typescript",
        "yaml",
        "python",
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
        disable = {},
      },
      indent = {
        enable = true,
        disable = { "yaml" },
      },
      autotag = {
        enable = true,
      },
    })
  end,
}
