local keymap = require "keymap"

return {
  {
    "mhartington/formatter.nvim",
    init = function()
      keymap { "<F5>", "<Cmd>FormatWrite<CR>" }
      require("formatter").setup {
        filetype = {
          c = { require("formatter.filetypes.c").clangformat },
          cpp = { require("formatter.filetypes.cpp").clangformat },
          lua = { require("formatter.filetypes.lua").stylua },
          markdown = { require("formatter.filetypes.markdown").prettier },
          python = { require("formatter.filetypes.python").autopep8 },
          rust = { require("formatter.filetypes.rust").rustfmt },
          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      }
    end,
  },
}
