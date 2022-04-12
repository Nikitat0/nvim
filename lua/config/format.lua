require("formatter").setup {
  filetype = {
    lua = {
      function()
        return {
          exe = "stylua",
          args = { "-s", "-" },
          stdin = true,
        }
      end,
    },
    rust = {
      function()
        return {
          exe = "rustfmt",
          args = { "+nightly", "--emit=stdout" },
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
    python = {
      function()
        return {
          exe = "autopep8",
          args = { "-" },
          stdin = true,
        }
      end,
    },
  },
}
