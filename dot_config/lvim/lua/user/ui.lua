-- Status line
lvim.builtin.lualine.options.component_separators = {
  left = lvim.icons.ui.DividerRight,
  right = lvim.icons.ui.DividerLeft,
}
lvim.builtin.lualine.options.section_separators = {
  left = lvim.icons.ui.BoldDividerRight,
  right = lvim.icons.ui.BoldDividerLeft,
}
lvim.builtin.lualine.sections.lualine_a = { "mode" }

-- UI Icons
lvim.builtin.which_key.setup.icons.group = "+"

-- Colorscheme
lvim.colorscheme = "onedark"
