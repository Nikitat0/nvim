local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
--lsp
map("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>", default_opts)
map("n", "<F7>", ":lua vim.lsp.buf.hover()<CR>", default_opts)
--snippets
vim.cmd [[
imap <expr> <CR> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<CR>'
smap <expr> <CR> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<CR>'

imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
]]
--format
map("n", "<F4>", ":FormatWrite<CR>", default_opts)
--file explorer
map(
  "n",
  "<F6>",
  ":NvimTreeRefresh<CR>:NvimTreeFindFileToggle<CR>",
  default_opts
)
--find
map("n", "<leader>p", ":Telescope projects<CR>", default_opts)
map("n", "<leader>f", ":Telescope find_files<CR>", default_opts)
map("n", "<F3>", ":Telescope live_grep<CR>", default_opts)

map("n", "<leader>lr", ":Telescope lsp_references<CR>", default_opts)
map("n", "<leader>ls", ":Telescope lsp_document_symbols<CR>", default_opts)
map("n", "<leader>lS", ":Telescope lsp_workspace_symbols<CR>", default_opts)
map("n", "<leader>la", ":Telescope lsp_code_actions<CR>", default_opts)
map("n", "<leader>l", ":Telescope diagnostics<CR>", default_opts)
map("n", "<leader>li", ":Telescope lsp_implementations<CR>", default_opts)
map("n", "<leader>ld", ":Telescope lsp_definitions<CR>", default_opts)
map("n", "<leader>lt", ":Telescope lsp_type_definitions<CR>", default_opts)

map("n", "<leader>gf", ":Telescope git_files<CR>", default_opts)
map("n", "<leader>gc", ":Telescope git_commits<CR>", default_opts)
map("n", "<leader>gb", ":Telescope git_branches<CR>", default_opts)
map("n", "<leader>gd", ":Telescope git_status<CR>", default_opts)
map("n", "<leader>gs", ":Telescope git_stash<CR>", default_opts)
--bufferline
map("n", "<Tab>", ":BufferLineCycleNext<CR>", default_opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", default_opts)
map("n", "<Tab><Tab>", ":BufferLinePick<CR>", default_opts)
map("n", "<Tab>j", ":BufferLineMovePrev<CR>", default_opts)
map("n", "<Tab>k", ":BufferLineMoveNext<CR>", default_opts)
map("n", "<Tab>c", ":bdelete<CR>", default_opts)
map("n", "<Tab>C", ":bdelete!<CR>", default_opts)
map("n", "<Tab><Tab>c", ":BufferLinePickClose<CR>", default_opts)
map("n", "<S-Tab>j", ":BufferLineCloseLeft<CR>", default_opts)
map("n", "<S-Tab>k", ":BufferLineCloseRight<CR>", default_opts)
--utils
map("i", "jj", "<Esc>", { noremap = true })
map("t", "jj", "<C-\\><C-n>", { noremap = true })

map("", "<up>", ':echoe "Use k"<CR>', { noremap = true, silent = false })
map("", "<down>", ':echoe "Use j"<CR>', { noremap = true, silent = false })
map("", "<left>", ':echoe "Use h"<CR>', { noremap = true, silent = false })
map("", "<right>", ':echoe "Use l"<CR>', { noremap = true, silent = false })

map("n", "<F1>", ":h ", { noremap = false })

map("n", "<leader>v", ":MarkdownPreview<CR>", default_opts)
