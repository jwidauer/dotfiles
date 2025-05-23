---@type LazySpec
return {
  "akinsho/toggleterm.nvim",
  --@type ToggleTermConfig
  opts = {
    shading_factor = 2,
    highlights = {
      NormalFloat = { link = "Normal" },
    },
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
    winbar = {
      enabled = false,
    },
  },
}
