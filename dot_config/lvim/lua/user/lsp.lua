local index_of = function(array, value)
  for i, v in ipairs(array) do
    if v == value then
      return i
    end
  end
  return nil
end

local lsp_manager = require("lvim.lsp.manager")

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd", "rust_analyzer" })

-- Special setup for clangd
local capabilities = require("lvim.lsp").common_capabilities()
capabilities.offsetEncoding = { "utf-16" }
lsp_manager.setup("clangd", { capabilities = capabilities })

-- Enable markdown filetype
local markdown_idx = index_of(lvim.lsp.automatic_configuration.skipped_filetypes, "markdown")
if markdown_idx then
  table.remove(lvim.lsp.automatic_configuration.skipped_filetypes, markdown_idx)
end
lsp_manager.setup("marksman")
