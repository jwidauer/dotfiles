-- General options
vim.opt.timeoutlen = 100
vim.opt.relativenumber = true

---- Key mappings
-- Easier way to enter command mode
lvim.keys.normal_mode[";"] = { ":", { noremap = true, silent = false } }
lvim.keys.visual_mode[";"] = { ":", { noremap = true, silent = false } }

-- Helix style navigation
-- normal
lvim.lsp.buffer_mappings.normal_mode["gh"] = { "0", "Goto start of line" }
lvim.lsp.buffer_mappings.normal_mode["gs"] = { "^", "Goto start of line (non-blank)" }
lvim.lsp.buffer_mappings.normal_mode["gl"] = { "$", "Goto end of line" }
lvim.lsp.buffer_mappings.normal_mode["ge"] = { "G", "Goto last line" }
lvim.lsp.buffer_mappings.normal_mode["gn"] = { "<cmd>BufferLineCycleNext<cr>", "Goto next buffer" }
lvim.lsp.buffer_mappings.normal_mode["gp"] = { "<cmd>BufferLineCyclePrev<cr>", "Goto previous buffer" }
-- visual
lvim.lsp.buffer_mappings.visual_mode["gh"] = { "0", "Start of line" }
lvim.lsp.buffer_mappings.visual_mode["gs"] = { "^", "Start of line (non-blank)" }
lvim.lsp.buffer_mappings.visual_mode["gl"] = { "$", "End of line" }
lvim.lsp.buffer_mappings.visual_mode["ge"] = { "G", "Last line" }
lvim.lsp.buffer_mappings.visual_mode["gn"] = { "<cmd>BufferLineCycleNext<cr>", "Goto next buffer" }
lvim.lsp.buffer_mappings.visual_mode["gp"] = { "<cmd>BufferLineCyclePrev<cr>", "Goto previous buffer" }

-- Trouble mappings
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "Trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "Location list" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "References" }
}

-- Enable more which-key mappings
lvim.builtin.which_key.setup.plugins.marks = true
lvim.builtin.which_key.setup.plugins.registers = true
lvim.builtin.which_key.setup.plugins.presets.operators = true
lvim.builtin.which_key.setup.plugins.presets.motions = true
lvim.builtin.which_key.setup.plugins.presets.text_objects = true
lvim.builtin.which_key.setup.plugins.presets.windows = true
lvim.builtin.which_key.setup.plugins.presets.nav = true
lvim.builtin.which_key.setup.plugins.presets.z = true
lvim.builtin.which_key.setup.plugins.presets.g = true

---- Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
        }
      })
    end,
  },
  {
    "wfxr/minimap.vim",
    build = "cargo install --locked code-minimap",
    config = function()
      vim.g.minimap_width = 10
      vim.g.minimap_auto_start = 1
      vim.g.minimap_auto_start_win_enter = 1
      vim.g.minimap_highlight_range = 1
      vim.g.minimap_highlight_search = 1
      vim.g.minimap_git_colors = 1
    end,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "darker",
      })
    end,
  }
}

---- LSP
-- Special setup for clangd
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
local capabilities = require("lvim.lsp").common_capabilities()
capabilities.offsetEncoding = { "utf-16" }
local opts = { capabilities = capabilities }
require("lvim.lsp.manager").setup("clangd", opts)

---- Appearance
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
