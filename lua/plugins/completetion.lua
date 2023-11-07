local keymap = require "keymap"

return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2",
    name = "luasnip",
  },
  {
    "rafamadriz/friendly-snippets",
    name = "snippets",
    init = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    -- TODO: Remove dependency on snippets
    dependencies = { "luasnip", "snippets" },
    init = function()
      local luasnip = require "luasnip"
      local cmp = require "cmp"

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        -- TODO: Maybe reorder sources?
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "async_path" },
          { name = "buffer" },
        },
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif cmp.visible() then
              cmp.confirm { select = true }
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-Space>"] = cmp.mapping.confirm { select = true },
          -- TODO: Fix backspace in snippet selection
        },
      }
      cmp.setup.filetype(
        "gitcommit",
        { sources = cmp.config.sources { { name = "cmp_git" } } }
      )
      -- TODO: Setup cmdline autocompletetion
      for _, mode in ipairs { "/", "?" } do
        cmp.setup.cmdline(mode, { sources = { { name = "buffer" } } })
      end
    end,
  },
  "FelipeLema/cmp-async-path",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "petertriho/cmp-git",
  "saadparwaiz1/cmp_luasnip",
}
