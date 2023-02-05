require("dressing").setup {
  input = {
    prompt_align = "center",
    insert_only = false,
    border = "rounded",
    relative = "win",
    prefer_width = 0.4,
    win_options = {
      winblend = 0,
    }
  },
  select = {
    enabled = false,
    backend = "telescope",
    telescope = require("telescope.themes").get_dropdown(),
  },
}
