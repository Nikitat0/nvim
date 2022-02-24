vim.cmd [[packadd packer.nvim]]

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons'

  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip'

  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'

  use 'kyazdani42/nvim-tree.lua'

  use 'powerman/vim-plugin-ruscmd'

  use 'doums/darcula'

  use 'andweeb/presence.nvim'
end)
