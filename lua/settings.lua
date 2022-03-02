local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt

cmd(
  [[
filetype indent plugin on
syntax enable
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]],
  true
)

opt.expandtab = true
opt.shiftwidth = 4

opt.tabstop = 4
opt.smartindent = true

opt.colorcolumn = "80"
opt.cursorline = true
opt.number = true

opt.so = 1000

opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true
cmd "colorscheme darcula"

vim.o.timeoutlen = 250

local lsp_installer = require "nvim-lsp-installer"
lsp_installer.on_server_ready(function(server)
  server:setup {}
end)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
vim.o.completeopt = "menuone,noselect"

local luasnip = require "luasnip"

local cmp = require "cmp"
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    {
      name = "buffer",
      options = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
  },
  mapping = {
    ["<C-Space>"] = cmp.mapping.confirm { select = true },
  },
}

require("nvim-tree").setup {
  disable_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  auto_close = true,
  auto_reload_on_write = true,
  hijack_cursor = true,
  update_cwd = true,
  hijack_unnamed_buffer_when_opening = true,
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    change_dir = {
      enable = true,
    },
    open_file = {
      quit_on_open = true,
    },
  },
}

require("bufferline").setup {}
require("lualine").setup {}

require("formatter").setup {
  filetype = {
    lua = {
      function()
        return {
          exe = "stylua",
          args = {
            "--call-parentheses",
            "None",
            "--column-width",
            "80",
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "-",
          },
          stdin = true,
        }
      end,
    },
    rust = {
      function()
        return {
          exe = "rustfmt",
          args = { "--emit=stdout" },
          stdin = true,
        }
      end,
    },
    cpp = {
      function()
        return {
          exe = "clang-format",
          args = { "-" },
          stdin = true,
        }
      end,
    },
  },
}
