local opts = { noremap = true, silent = true }
local keymaps = vim.api.nvim_set_keymap
local lsp_keymaps = vim.api.nvim_buf_set_keymap

keymaps('n', '<Sapace>', '<NOP>',opts)

vim.g.mapleader = "\\" 

--LeaderKey 
keymaps('n', '<Leader>h', ':set hlsearch!<CR>',opts)

--Open/Close Nvin tree 
keymaps('n', '<Leader>t', ':NvimTreeToggle<CR>',opts)


--Resize Window
keymaps('n', '<M-l>', ':vertical resize -2<CR>',{silent = true})
keymaps('n', '<M-h>', ':vertical resize +2<CR>',{silent = true})

--Better Window navigator
keymaps('n', '<C-h>', '<C-w>h',{silent = true})
keymaps('n', '<C-l>', '<C-w>l',{silent = true})
keymaps('n', '<M-Left>', '<C-w>h',{silent = true})
keymaps('n', '<M-Right>', '<C-w>l',{silent = true})

--Better indenting
keymaps('v', '<', '<gv',opts)
keymaps('v', '>', '>gv',opts)

--Tab switch buffers
keymaps('n', '<TAB>', ':bnext<CR>',opts)
keymaps('n', '<S-TAB>', ':bprevious<CR>',opts)

--Move selected line in visual mode, up and dowm
keymaps("x", "J", ":move '>+1<CR>gv-gv", opts)
keymaps("x", "K", ":move '<-2<CR>gv-gv", opts)
keymaps("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymaps("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


-- Telescope
keymaps("n", "<leader>p", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ file_previewer = true }))<cr>", opts)
keymaps("n", "<leader>g", "<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy({ file_previewer = true }))<cr>", opts)


--LSP
lsp_keymaps(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
lsp_keymaps(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
lsp_keymaps(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
lsp_keymaps(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
lsp_keymaps(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- lsp_keymaps(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
lsp_keymaps(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- lsp_keymaps(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- lsp_keymaps(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
lsp_keymaps(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
lsp_keymaps(
  bufnr,
  "n",
  "gh",
  '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
  opts
)
lsp_keymaps(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
lsp_keymaps(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
keymaps("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
