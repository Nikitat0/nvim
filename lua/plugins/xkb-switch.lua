return {
  "ivanesmantovich/xkbswitch.nvim",
  cond = function()
    return os.execute "xkb-switch" == 0
  end,
  init = function()
    require "xkbswitch"
  end,
}
