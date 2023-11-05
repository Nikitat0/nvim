local keymap = require "keymap"

return {
  {
    "pocco81/auto-save.nvim",
    init = function()
      require("auto-save").setup()
      keymap { "<F12>s", "<Cmd>ASToggle<CR>", silent = false }
    end,
  },
}
