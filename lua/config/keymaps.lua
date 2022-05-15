local map = require "config.keymap"

--lsp
map { "<F2>", vim.lsp.buf.rename }
map { "<F7>", vim.lsp.buf.hover }

--find
map { "<leader>f", "<Cmd>Telescope find_files<CR>" }
map { "<F3>", "<Cmd>Telescope live_grep<CR>" }

map { "<leader>lr", "<Cmd>Telescope lsp_references<CR>" }
map { "<leader>ls", "<Cmd>Telescope lsp_document_symbols<CR>" }
map { "<leader>lS", "<Cmd>Telescope lsp_workspace_symbols<CR>" }
map { "<leader>la", vim.lsp.buf.code_action }
map { "<leader>lA", vim.lsp.buf.range_code_action }
map { "<leader>l", "<Cmd>Telescope diagnostics<CR>" }
map { "<leader>li", "<Cmd>Telescope lsp_implementations<CR>" }
map { "<leader>ld", "<Cmd>Telescope lsp_definitions<CR>" }
map { "<leader>lt", "<Cmd>Telescope lsp_type_definitions<CR>" }
--snippets
for _, mode in ipairs { "s", "i" } do
  map {
    mode = mode,
    "<CR>",
    "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<CR>'",
    expr = true,
  }
  map {
    mode = mode,
    "<Tab>",
    "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'",
    expr = true,
  }
  map {
    mode = mode,
    "<S-Tab>",
    "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'",
    expr = true,
  }
end
--format
map { "<F4>", "<Cmd>FormatWrite<CR>" }
--file explorer
map { "<F6>", "<Cmd>NvimTreeRefresh<CR><Cmd>NvimTreeFindFileToggle<CR>" }
--buffers
map { "<Tab>", "<Cmd>Telescope buffers<CR>" }
map { "<Tab>c", "<Cmd>bdelete<CR>" }
map { "<Tab>C", "<Cmd>bdelete!<CR>" }
--utils
map { mode = "i", "jj", "<Esc>" }
map { mode = "t", "jj", "<C-\\><C-n>" }

for _, mode in ipairs { "", "i" } do
  map { mode = mode, "<up>", '<Cmd>echoe "Use k"<CR>', silent = false }
  map { mode = mode, "<down>", '<Cmd>echoe "Use j"<CR>', silent = false }
  map { mode = mode, "<left>", '<Cmd>echoe "Use h"<CR>', silent = false }
  map { mode = mode, "<right>", '<Cmd>echoe "Use l"<CR>', silent = false }
end

map { "<F1>", ":h ", silent = false }

map { "<leader>v", "<Cmd>MarkdownPreview<CR>" }
--git
map { "<leader>[", "<Cmd>Gitsigns prev_hunk<CR>" }
map { "<leader>]", "<Cmd>Gitsigns next_hunk<CR>" }
map { "<leader>ga", "<Cmd>Gitsigns stage_hunk<CR>" }
map { "<leader>gA", "<Cmd>Gitsigns stage_buffer<CR>" }
map { "<leader>gu", "<Cmd>Gitsigns undo_stage_hunk<CR>" }
map { "<leader>gU", "<Cmd>Gitsigns reset_buffer_index<CR>" }
map { "<leader>gc", "<Cmd>Git commit | only<CR>" }
map { "<leader>gC", "<Cmd>Git commit --amend | only<CR>" }
map { "<leader>gp", "<Cmd>Git push<CR>" }
map { "<leader>gP", "<Cmd>Git push --force<CR>" }
map { "<leader>g", "<Cmd>Git<CR>" }
map { "<leader>gf", "<Cmd>Telescope git_files<CR>" }
map { "<leader>gb", "<Cmd>Telescope git_branches<CR>" }
