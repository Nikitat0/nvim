local keymap = require "keymap"

return {
  {
    "mhartington/formatter.nvim",
    init = function()
      keymap { "<F5>", "<Cmd>Format<CR>" }
      require("formatter").setup {
        filetype = {
          c = { require("formatter.filetypes.c").clangformat },
          cpp = { require("formatter.filetypes.cpp").clangformat },
          javascript = { require("formatter.filetypes.javascript").prettier },
          lua = { require("formatter.filetypes.lua").stylua },
          markdown = { require("formatter.filetypes.markdown").prettier },
          python = { require("formatter.filetypes.python").autopep8 },
          rust = { require("formatter.filetypes.rust").rustfmt },
          ["*"] = {
            function()
              if vim.bo.filetype ~= "markdown" then
                return require("formatter.filetypes.any").remove_trailing_whitespace()
              end
              return nil
            end,
          },
        },
      }
    end,
  },
}
