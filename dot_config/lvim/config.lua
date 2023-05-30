-- General options
vim.opt.timeoutlen = 100
vim.opt.relativenumber = true

require("formatters")
require("keymappings")
require("lsp")
require("ui")

---- Plugins
lvim.plugins = {
  require("plugins.copilot"),
  require("plugins.git-blame"),
  require("plugins.minimap"),
  require("plugins.neoscroll"),
  require("plugins.nvim-bqf"),
  require("plugins.onedark"),
  require("plugins.symbols-outline"),
  require("plugins.trouble"),
  require("plugins.vim-surround"),
  require("plugins.wilder")
}
