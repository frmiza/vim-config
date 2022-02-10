local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require('packer').startup(function()
-- Packer can manage itself
  use 'wbthomason/packer.nvim'

-- Cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  use "hrsh7th/cmp-nvim-lsp"

-- Luasnip
  use 'L3MON4D3/LuaSnip'

-- LSP
  use 'neovim/nvim-lspconfig'

-- Null-LS 
  use 'jose-elias-alvarez/null-ls.nvim'

-- Bufferline
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

-- Lualine
  use {
    'glepnir/galaxyline.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

-- Tree
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

-- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate", }

-- Autopairs
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

-- ToggleTerm 
  use "akinsho/toggleterm.nvim"

-- Lsp_signature
  use 'ray-x/lsp_signature.nvim'

--Telescope
  use {
    'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }

-- Themes
  use 'norcalli/nvim-colorizer.lua'
  use 'monsonjeremy/onedark.nvim'
  use 'folke/tokyonight.nvim'
end)
