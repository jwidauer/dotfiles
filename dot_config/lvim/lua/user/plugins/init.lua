local function build_plugin_table(base_path, modules)
  local plugin_table = {}
  for i, module in ipairs(modules) do
    plugin_table[i] = require(base_path .. "." .. module)
  end
  return plugin_table
end

local plugins = {
  "copilot",
  "crates",
  "fidget",
  "flash",
  "git-blame",
  "minimap",
  "nvim-bqf",
  "onedark",
  "rust-tools",
  "symbols-outline",
  "trouble",
  "vim-surround",
  "wilder"
}

lvim.plugins = build_plugin_table("user.plugins", plugins)
