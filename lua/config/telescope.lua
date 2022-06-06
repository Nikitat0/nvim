local keymaps = require "config.keymaps"

local telescope = require "telescope"
telescope.setup {
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_mru = true,
      sort_lastused = true,
    },
    live_grep = {
      grep_open_files = true,
    },
  },
}

local map = require "config.keymap"
local builtins = require "telescope.builtin"

map { "<Tab>", builtins.buffers }
map { "<leader>f", builtins.fd }
map {
  "<leader>F",
  function()
    builtins.fd { hidden = true, no_ignore = true }
  end,
}
map { "<F3>", builtins.live_grep }
map {
  "<leader><F3>",
  function()
    builtins.live_grep { grep_open_files = false }
  end,
}
