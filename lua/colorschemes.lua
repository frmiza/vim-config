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
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
vim.g.tokyonight_transparent = true

vim.cmd[[colorscheme tokyonight]]
