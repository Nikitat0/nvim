vim.cmd [[packadd packer.nvim]]

local use = require("packer").use
require("packer").startup(function()
  --plugin management
  use "wbthomason/packer.nvim"
  --lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  --autocomplete
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  --format
  use "mhartington/formatter.nvim"
  --icons
  use "kyazdani42/nvim-web-devicons"
  --file explorer
  use "kyazdani42/nvim-tree.lua"
  --bufferline
  use "akinsho/bufferline.nvim"
  --status
  use "nvim-lualine/lualine.nvim"
  --utils
  use "Pocco81/AutoSave.nvim"
  use "powerman/vim-plugin-ruscmd"
  --theme
  use "doums/darcula"
end)
