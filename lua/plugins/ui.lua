local keymap = require "keymap"

return {
  {
    "stevearc/oil.nvim",
    opts = {},
    init = function()
      local oil = require "oil"
      keymap { "<F6>", oil.open }
      keymap {
        "<leader><F6>",
        function()
          oil.open(vim.fn.getcwd())
        end,
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    events = "Colorscheme",
    init = function()
      require("lualine").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    branch = "0.1.x",
    name = "telescope",
    init = function()
      local pickers = require "telescope.builtin"
      keymap { "<F1>", pickers.help_tags }
      keymap { "<F3>", pickers.live_grep }
      keymap { "<F4>", pickers.find_files }
      keymap {
        "<leader><F4>",
        function()
          pickers.find_files { hidden = true }
        end,
      }
      keymap {
        "<F12>c",
        function()
          pickers.colorscheme { enable_preview = true }
        end,
      }
      keymap { "<Tab>", pickers.buffers }
    end,
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  "nvim-tree/nvim-web-devicons",
}
