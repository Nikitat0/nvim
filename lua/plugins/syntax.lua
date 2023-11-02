return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      vim.cmd "TSUpdate"
    end,
    init = function()
      require("nvim-treesitter.configs").setup {
        sync_install = false,
        highlight = { enable = true },
      }
    end,
  },
}
