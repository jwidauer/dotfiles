local M = {
  url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  event = { "BufRead", "BufNew" },
  ft = { "python", "cpp" },
  dependencies = { "nvim-lspconfig" },
  config = function()
    require("sonarlint").setup({
      server = {
        cmd = {
          vim.fn.expand('$MASON/packages/sonarlint-language-server/sonarlint-language-server.cmd'),
          -- Ensure that sonarlint-language-server uses stdio channel
          '-stdio',
          '-analyzers',
          -- Paths to the needed analyzers
          vim.fn.expand("$MASON/packages/sonarlint-language-server/extension/analyzers/sonarpython.jar"),
          vim.fn.expand("$MASON/packages/sonarlint-language-server/extension/analyzers/sonarcfamily.jar"),
        }
      },
      filetypes = { "python", "cpp" },
    })
  end
}

return M
