local keymap = require "keymap"

return {
  "williamboman/mason.nvim",
  name = "mason",
  build = function()
    require("mason").setup()
    vim.cmd "MasonUpdate"
  end,
  init = function()
    require("mason").setup()
    keymap { "<F12>t", "<Cmd>Mason<CR>" }
  end,
}
