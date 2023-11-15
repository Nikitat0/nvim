local keymap = require "keymap"

return {
  {
    "christoomey/vim-tmux-navigator",
    cond = function()
      return os.getenv "TMUX" ~= nil
    end,
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
      vim.g.tmux_navigator_save_on_switch = 1
      keymap { "<A-h>", "<Cmd>TmuxNavigateLeft<CR>" }
      keymap { "<A-j>", "<Cmd>TmuxNavigateDown<CR>" }
      keymap { "<A-k>", "<Cmd>TmuxNavigateUp<CR>" }
      keymap { "<A-l>", "<Cmd>TmuxNavigateRight<CR>" }
    end,
  },
  {
    "ivanesmantovich/xkbswitch.nvim",
    cond = function()
      return os.execute "xkb-switch" == 0
    end,
    init = function()
      require("xkbswitch").setup()
    end,
  },
}
