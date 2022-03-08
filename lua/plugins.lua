vim.cmd [[packadd packer.nvim]]

local use = require("packer").use
require("packer").startup(function()
  --libraries
  use "nvim-lua/plenary.nvim"
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
  use "hrsh7th/cmp-git"

  use "hrsh7th/vim-vsnip"
  use "hrsh7th/vim-vsnip-integ"
  --format
  use "editorconfig/editorconfig-vim"
  use "mhartington/formatter.nvim"
  --comment
  use "numToStr/Comment.nvim"
  --icons
  use "kyazdani42/nvim-web-devicons"
  --file explorer
  use "kyazdani42/nvim-tree.lua"
  --find
  use "nvim-telescope/telescope.nvim"
  --project
  use "ahmedkhalf/project.nvim"
  --bufferline
  use "akinsho/bufferline.nvim"
  --status
  use "nvim-lualine/lualine.nvim"
  --utils
  use "windwp/nvim-autopairs"
  use "Pocco81/AutoSave.nvim"
  use "powerman/vim-plugin-ruscmd"
  --theme
  use "doums/darcula"
end)
