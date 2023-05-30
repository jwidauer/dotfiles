local M = {
  "navarasu/onedark.nvim",
  config = function()
    require("onedark").setup({
      style = "darker",
    })
  end,
}

return M
