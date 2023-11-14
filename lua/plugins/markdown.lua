local keymap = require "keymap"

return {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  config = function()
    require("peek").setup()
    keymap { "<F10>", require("peek").open }
  end,
}
