require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    comments = true,
    folds = true,
    operators = false,
    strings = false,
  },
  strikethrough = true,
  contrast = "hard",
})
vim.cmd("colorscheme gruvbox")
