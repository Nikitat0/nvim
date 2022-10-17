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

cmp.setup.cmdline(":", { sources = { { name = "cmdline" } } })

cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })
cmp.setup.cmdline("?", { sources = { { name = "buffer" } } })

cmp.setup.filetype(
  "gitcommit",
  { sources = cmp.config.sources { { name = "cmp_git" } } }
)
