local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
--vim
g.mapleader = " "
--lsp
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {}
  end,
}
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

local function open_nvim_tree(data)
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  if directory then
    vim.cmd.cd(data.file)
  end

  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
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

vim.api.nvim_call_function("system", { "xkb-switch" })
if vim.v.shell_error == 0 then
  require("xkbswitch").setup()
end
