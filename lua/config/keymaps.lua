local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Delete word backward
keymap("n", "dw", "vb_d")

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

--Resize Window
keymap("n", "<M-h>", "<C-w>>", opts)
keymap("n", "<M-l>", "<C-w><", opts)
keymap("n", "<M-Left>", "<C-w>>", opts)
keymap("n", "<M-Right>", "<C-w><", opts)

--Better Window navigator
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

--Better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- JumpList
keymap("n", "<C-m>", "<C-i>", opts)

-- Split
keymap("n", "<M-sv>", ":vsplit<Return>", opts)

--Tab switch buffers
keymap("n", "te", ":tabedit<CR>", opts)
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

--Move selected line in visual mode, up and dowm
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Save and format
keymap("n", "ff", function()
	require("conform").format()
end, { desc = "Save and Format Current File" })
