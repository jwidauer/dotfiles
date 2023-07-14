local function require_modules(base_path, modules)
  for _, module in ipairs(modules) do
    require(base_path .. "." .. module)
  end
end

require_modules("user",
  {
    "autocommands",
    "dap",
    "formatters",
    "keymaps",
    "lsp",
    "plugins",
    "ui",
  })
