return {
  "folke/snacks.nvim",
  keys = {
    {
      "<c-/>",
      function()
        Snacks.terminal(nil, { cwd = vim.fn.expand("%:p:h") })
      end,
      mode = { "n", "t" },
      desc = "Toggle Terminal (buffer dir)",
    },
    {
      "<c-_>",
      function()
        Snacks.terminal(nil, { cwd = vim.fn.expand("%:p:h") })
      end,
      mode = { "n", "t" },
      desc = "Toggle Terminal (buffer dir)",
    },
  },
}
