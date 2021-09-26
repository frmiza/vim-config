require("bufferline").setup{}

--Keybinds
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferLineCycleNext<CR>',{noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferLineCyclePrev<CR>',{noremap = true, silent = true})

--vim.api.nvim_set_keymap('n', '<C-q', ':bdelete<CR>',{noremap = false, silent = true})
