vim.api.nvim_set_keymap('n', '<Sapace>', '<NOP>',{noremap = true, silent = true})

vim.g.mapleader = ' ' 

--LeaderKey 
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>',{noremap = true, silent = true})

--Open/Close Nvin tree 
vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<CR>',{noremap = true, silent = true})


--Resize Window
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize -2<CR>',{silent = true})
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize +2<CR>',{silent = true})

--Better Window navigator
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h',{silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l',{silent = true})
vim.api.nvim_set_keymap('n', '<M-Left>', '<C-w>h',{silent = true})
vim.api.nvim_set_keymap('n', '<M-Right>', '<C-w>l',{silent = true})

--Better indenting
vim.api.nvim_set_keymap('v', '<', '<gv',{noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv',{noremap = true, silent = true})

--Tab switch buffers
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>',{noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>',{noremap = true, silent = true})

--Move selected line in visual mode, up and dowm
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv\'',{noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv\'',{noremap = true, silent = true})
