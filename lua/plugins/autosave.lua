local keymap = require "keymap"

return {
  {
    "pocco81/auto-save.nvim",
    opts = {
      condition = function(buf)
        return vim.fn.getbufvar(buf, "&filetype") ~= "oil"
      end,
    },
    init = function()
      keymap { "<F12>s", "<Cmd>ASToggle<CR>", silent = false }
    end,
  },
}
