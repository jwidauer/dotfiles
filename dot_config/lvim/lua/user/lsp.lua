vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

-- Special setup for clangd
local capabilities = require("lvim.lsp").common_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lvim.lsp.manager").setup("clangd", { capabilities = capabilities })