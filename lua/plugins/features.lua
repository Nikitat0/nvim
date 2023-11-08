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
}
