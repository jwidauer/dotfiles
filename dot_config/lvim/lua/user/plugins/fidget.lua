local M = {
  "j-hui/fidget.nvim",
  config = function()
    require("fidget").setup({
      text = {
        spinner = "dots",
      }
    })
  end,
}

return M
