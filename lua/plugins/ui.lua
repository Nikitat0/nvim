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
        nesting_rules = {},
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
  "nvim-tree/nvim-web-devicons",
}
