local M = {
  "j-hui/fidget.nvim",
  config = function()
    require("fidget").setup({
      progress = {
        display = {
          progress_icon = { pattern = "dots", period = 1 }
        }
      }
    })
  end,
}

return M
