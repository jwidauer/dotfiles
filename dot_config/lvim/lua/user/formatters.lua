local formatters = require("lvim.lsp.null-ls.formatters")

formatters.setup({
  {
    exe = "black",
    filetypes = { "python" },
  },
  {
    name = "markdownlint",
    filetype = { "markdown" },
  }
})

lvim.format_on_save = true
