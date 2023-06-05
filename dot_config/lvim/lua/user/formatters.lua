local formatters = require("lvim.lsp.null-ls.formatters")

formatters.setup({
  {
    exe = "black",
    filetypes = { "python" },
  },
})

lvim.format_on_save = true
