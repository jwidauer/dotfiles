local M = {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
      },
      filetypes = {
        ["*"] = true,
      }
    })
  end,
}

return M
