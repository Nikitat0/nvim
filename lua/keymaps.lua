local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

--file explorer
map("n", "<F6>", ":NvimTreeRefresh<CR>:NvimTreeFocus<CR>", default_opts)
--bufferline
map("n", "<Tab>", ":BufferLineCycleNext<CR>", default_opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", default_opts)
map("n", "<Tab><Tab>", ":BufferLinePick<CR>", default_opts)
map("n", "<Tab>j", ":BufferLineMovePrev<CR>", default_opts)
map("n", "<Tab>k", ":BufferLineMoveNext<CR>", default_opts)
map("n", "<Tab>c", ":bdelete<CR>", default_opts)
map("n", "<Tab><Tab>c", ":BufferLinePickClose<CR>", default_opts)
map("n", "<S-Tab>j", ":BufferLineCloseLeft<CR>", default_opts)
map("n", "<S-Tab>k", ":BufferLineCloseRight<CR>", default_opts)
--utils
map("i", "jj", "<Esc>", { noremap = true })

map("", "<up>", ':echoe "Use k"<CR>', { noremap = true, silent = false })
map("", "<down>", ':echoe "Use j"<CR>', { noremap = true, silent = false })
map("", "<left>", ':echoe "Use h"<CR>', { noremap = true, silent = false })
map("", "<right>", ':echoe "Use l"<CR>', { noremap = true, silent = false })
