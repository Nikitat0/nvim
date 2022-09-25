local map = require "config.keymap"
map { "<F4>", "<Cmd>Neoformat<CR>" }

vim.g.neoformat_rust_rustfmt = {
  exe = "rustfmt",
  args = { "+nightly" },
  stdin = 1,
}
