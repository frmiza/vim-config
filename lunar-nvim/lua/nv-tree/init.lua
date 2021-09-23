vim.g.nvim_tree_ignore = { '.git', 'node_modules', 'dist' }
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1,
  folder_arrows = 1
}
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_window_picker_exclude = {
  filetype = {
    "packer",
    "qf",
    "Trouble"
  }
}

vim.g.nvim_tree_show_icons = {
     git = 1,
     folders = 1,
     files = 1,
     folder_arrows = 0,
    }
    
vim.g.nvim_tree_icons = {
	default = '',
	git= {
		unstaged = "✗",
		staged = "✓",
		unmerged = "",
		renamed = "➜",
		untracked = "★"
	},
	folder = {
		default = "1",
		open = "2"
	}
}

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {
	noremap = true,
	silent = true
})

vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', {
	noremap = true,
	silent = true
})
