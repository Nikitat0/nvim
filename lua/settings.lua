local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt

opt.colorcolumn = '80'
opt.cursorline = true
opt.number = true

opt.termguicolors = true
cmd'colorscheme darcula'

vim.o.timeoutlen = 250

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    server:setup({})
end)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
vim.o.completeopt = 'menuone,noselect'

local luasnip = require 'luasnip'

local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer', options = {
            get_bufnrs = function()
                return vim.api.nvim_list_bufs()
            end
    }},
    },
}

require('presence'):setup({
    auto_update         = true,
    neovim_image_text   = "Neovim",
    main_image          = "neovim",
    client_id           = "793271441293967371",
    log_level           = nil,
    debounce_timeout    = 10,
    enable_line_number  = false,
    blacklist           = {},
    buttons             = true,
    file_assets         = {},
    editing_text        = "Editing %s",
    file_explorer_text  = "Browsing %s",
    git_commit_text     = "Committing changes",
    plugin_manager_text = "Managing plugins",
    reading_text        = "Reading %s",
    workspace_text      = "Working on %s",
})

require'nvim-tree'.setup {
      disable_netrw        = true,
      open_on_setup        = false,
      ignore_ft_on_setup   = {},
      hijack_directories   = {
        enable = true,
        auto_open = true,
      },
      auto_close           = true,
      auto_reload_on_write = true,
      hijack_cursor        = true,
      update_cwd           = true,
      hijack_unnamed_buffer_when_opening = true,
      diagnostics          = {
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

require'bufferline'.setup{}
require'lualine'.setup{}

