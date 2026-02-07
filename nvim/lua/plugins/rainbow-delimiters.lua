return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  dependencies = { "HiPhish/rainbow-delimiters.nvim" },
  config = function()
    local colors = {
      RainbowDelimiterRed = "#fb4934",
      RainbowDelimiterYellow = "#fabd2f",
      RainbowDelimiterBlue = "#83a598",
      RainbowDelimiterOrange = "#fe8019",
      RainbowDelimiterGreen = "#b8bb26",
      RainbowDelimiterViolet = "#d3869b",
      RainbowDelimiterCyan = "#8ec07c",
    }

    for group, color in pairs(colors) do
      vim.api.nvim_set_hl(0, group, { fg = color })
    end

    require("ibl").setup({
      indent = {
        char = "│",
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
      },
    })
  end,
}
