-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'  

--Galaxyline
  use {
    'glepnir/galaxyline.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

--  Tree
  use {
    'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons'
  }

--Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  -- themes
  use 'norcalli/nvim-colorizer.lua'
  use 'monsonjeremy/onedark.nvim'

end)
