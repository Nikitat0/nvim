local keymap = require "keymap"

return {
  "williamboman/mason.nvim",
  name = "mason",
  build = ":MasonUpdate",
  init = function()
    require("mason").setup()
    keymap { "<F12>t", "<Cmd>Mason<CR>" }
  end,
}
