return {
  {
    "vladdoster/remember.nvim",
    init = function()
      require "remember"
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      ignore = "^(%s*)$",
      mappings = {
        basic = true,
        extra = true,
      },
    },
  },
}
