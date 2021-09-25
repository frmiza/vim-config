require('plugins')
-- Configs 
require('settings')
require('keymappings')
require('colorschemes')

-- Plugins
require('nv-compee')
require('nv-colorizer')
require('nv-galaxyline')
require('nv-treesitter')
require('nv-bufferline')
require('nv-icons')
require('nv-autopairs')
require('nv-lspsaga')

--LSPs
require('lsp.init')
require('lsp.python-ls')
require('lsp.js-ts-ls')
require('lsp.ccls-ls')
