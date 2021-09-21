local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip' 
 --tree 
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  --Galaxyline
  use {
    'hoob3rt/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
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
