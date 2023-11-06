local keymap = require "keymap"

return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason", "lspconfig" },
    init = function()
      -- TODO: fix mason double setup
      require("mason").setup()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers {
        function(server)
          require("lspconfig")[server].setup {}
        end,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    dependencies = { "telescope" },
    init = function()
      keymap { "<F2>", vim.lsp.buf.rename }
      keymap { "<F7>", vim.lsp.buf.hover }
      -- TODO: add other keymaps
    end,
  },
}
