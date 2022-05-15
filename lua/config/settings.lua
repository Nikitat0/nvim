local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
--vim
g.mapleader = " "
--lsp
local lsp_installer = require "nvim-lsp-installer"
lsp_installer.on_server_ready(function(server)
  server:setup {}
end)
--autocomplete
local cmp = require "cmp"
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-c>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<CR>"] = cmp.mapping.confirm(),
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "crates" },
  },
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
local lspconfig = require "lspconfig"
local servers = { "clangd", "rust_analyzer", "pyright", "tsserver" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { capabilities = capabilities }
end

cmp.setup.cmdline(":", { sources = { { name = "cmdline" } } })

cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })
cmp.setup.cmdline("?", { sources = { { name = "buffer" } } })

cmp.setup.filetype(
  "gitcommit",
  { sources = cmp.config.sources { { name = "cmp_git" } } }
)
--comment
require("Comment").setup()
--parser
require("nvim-treesitter.configs").setup {
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
--file explorer
require("nvim-tree").setup {
  disable_netrw = true,
  open_on_setup = true,
  ignore_ft_on_setup = {},
  sort_by = "modification_time",
  hijack_unnamed_buffer_when_opening = true,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  hijack_cursor = true,
  update_cwd = true,
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  trash = {
    cmd = "trash",
    require_confirm = false,
  },
  actions = {
    change_dir = {
      enable = false,
    },
    open_file = {
      quit_on_open = true,
      window_picker = { enable = false },
    },
  },
  git = {
    enable = true,
    ignore = false,
  },
}
--find
require("telescope").load_extension "ui-select"
--status
require("lualine").setup {
  options = { disabled_filetypes = { "NvimTree" } },
  sections = { lualine_y = { "vim.fn.fnamemodify(vim.fn.getcwd(), ':t')" } },
}
--utils
require("nvim-autopairs").setup {}

require("nvim-lastplace").setup {}

require("gitsigns").setup { numhl = true }
--theme
cmd [[
set background=dark
let palenight_terminal_italics=1
colorscheme palenight
]]
