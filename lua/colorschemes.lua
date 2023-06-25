--require("nebulous").setup {
--  variant = "midnight",
--  disable = {
--    background = true,
--    endOfBuffer = false,
--  },
--  italic = {
--    comments   = false,
--    keywords   = true,
--    functions  = false,
--    variables  = true,
-- },
--}

--OneDark

--require("onedark").setup({
--  functionStyle = "italic",
--  transparent = true, 
----  Change the "hint" color to the "orange" color, and make the "error" color bright red
--  colors = {hint = "orange", error = "#ff0000"}
--})

--TokyoNight
require("tokyonight").setup({
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
})
vim.cmd[[colorscheme tokyonight]]

