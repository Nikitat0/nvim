local keymap = require "keymap"

return {
  "williamboman/mason.nvim",
  name = "mason",
  build = function()
    require("mason-registry").update()
  end,
  init = function()
    require("mason").setup()
    keymap { "<F12>t", "<Cmd>Mason<CR>" }
  end,
}
