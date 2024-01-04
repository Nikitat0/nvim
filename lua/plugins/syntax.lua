return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    init = function()
      require("nvim-treesitter.configs").setup {
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
}
