require("bufferline").setup{}
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferLineMoveNext<CR>',{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferLineMovePrev<CR>',{noremap = true, silent = true})
