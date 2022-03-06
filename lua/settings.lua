local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt
--vim
cmd [[
filetype indent plugin on
syntax enable
]]

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

opt.timeoutlen = 250
--lsp
local lsp_installer = require "nvim-lsp-installer"
lsp_installer.on_server_ready(function(server)
  server:setup {}
end)
--format
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

cmd [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]]
--file explorer
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
--bufferline
require("bufferline").setup {}
--status
require("lualine").setup {}
--theme
opt.termguicolors = true
cmd "colorscheme darcula"
