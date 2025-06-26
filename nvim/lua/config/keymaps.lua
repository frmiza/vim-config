local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Oil.nvim
map("n", "-", "<cmd>Oil<cr>", { desc = "Open oil.nvim" })
map("n", "<leader>-", function()
  require("oil").toggle_float()
end, { desc = "Open parent directory in floating window" })

-- Neo-tree
map("n", "<leader>E", "<cmd>Neotree toggle buffers<cr>", { desc = "Toggle Buffers Explorer" })

-- Telescope
map("n", "<C-p>", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fa", "<cmd>Telescope live_grep_args<cr>")
map("n", "<leader>fx", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,--glob=.env<cr>")

-- Tranparent
map("n", "<leader>uT", "<cmd>TransparentEnable<cr>", { desc = "Enable background transparency" })
map("n", "<leader>ut", "<cmd>TransparentToggle<cr>", { desc = "Toggle background transparency" })

-- mini.nvim
map("n", "<leader>C", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })

-- some utilities
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and Replace RegExp" })
map("n", "tn", "<cmd>tabnew<cr>")
map("n", "<leader>n", "<cmd>noh<cr>", { desc = "Remove highlighting of search matches" })

-- utilities to center the screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- visual
map("v", "p", '"_dP')
map("v", "<", "<gv")
map("v", ">", ">gv")

-- moving lines
map("x", "J", ":m '>+1<cr>gv=gv")
map("x", "K", ":m '<-2<cr>gv=gv")

--local keymap = vim.keymap.set
--local opts = { noremap = true, silent = true }
--local lsp_keymaps = vim.api.nvim_buf_set_keymap

--Open/Close Nvin tree
--keymap("n", "<Leader>t", ":NvimTreeToggle<CR>", opts)

-- Delete word backward
--keymap("n", "dw", "vb_d")

-- Select all
--keymap("n", "<C-a>", "gg<S-v>G")

--Resize Window
--keymap("n", "<M-h>", "<C-w>>", opts)
--keymap("n", "<M-l>", "<C-w><", opts)
--keymap("n", "<M-Left>", "<C-w>>", opts)
--keymap("n", "<M-Right>", "<C-w><", opts)

--Better Window navigator
--keymap("n", "<C-h>", "<C-w>h", opts)
--keymap("n", "<C-l>", "<C-w>l", opts)
--keymap("n", "<C-Left>", "<C-w>h", opts)
--keymap("n", "<C-Right>", "<C-w>l", opts)

--Better indenting
--keymap("v", "<", "<gv", opts)
--keymap("v", ">", ">gv", opts)

-- JumpList
--keymap("n", "<C-m>", "<C-i>", opts)

-- Split
--keymap("n", "<M-sv>", ":vsplit<Return>", opts)

--Tab switch buffers
--keymap("n", "te", ":tabedit<CR>", opts)
--keymap("n", "<TAB>", ":bnext<CR>", opts)
--keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

--Move selected line in visual mode, up and dowm
--keymap("x", "J", ":move '>+6<CR>gv-gv", opts)
--keymap("x", "K", ":move '<3<CR>gv-gv", opts)
--keymap("x", "<A-j>", ":move '>+6<CR>gv-gv", opts)
--keymap("x", "<A-k>", ":move '<3<CR>gv-gv", opts)
