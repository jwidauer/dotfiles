local M = {
  'mrcjkb/rustaceanvim',
  version = '^4',
  lazy = false,
  config = function(_, _)
    vim.g.rustaceanvim = {
      server = {
        on_attach = require('lvim.lsp').common_on_attach,
      }
    }
  end
}

return M
