local keymap = require "keymap"

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "plenary",
      "nui",
    },
    init = function()
      keymap { "<F6>", "<Cmd>Neotree toggle position=current<CR>" }
      require("neo-tree").setup {
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          hijack_netrw_behavior = "open_current",
          use_libuv_file_watcher = true,
        },
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    init = function()
      require("lualine").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    name = "telescope",
    dependencies = { "plenary" },
    init = function()
      local pickers = require "telescope.builtin"
      keymap { "<F1>", pickers.help_tags }
      keymap {
        "<F3>",
        function()
          pickers.live_grep { grep_open_files = true }
        end,
      }
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
      keymap { "<Tab><Tab>", pickers.buffers }
    end,
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  "nvim-tree/nvim-web-devicons",
}
