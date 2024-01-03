local keymap = require "keymap"

keymap { "<Tab>q", "<Cmd>bdelete<CR>" }
keymap { "<Tab>Q", "<Cmd>bdelete!<CR>" }
keymap { "<Tab><Tab>", "<C-^>" }
keymap { "<F12>p", "<Cmd>Lazy<CR>" }
