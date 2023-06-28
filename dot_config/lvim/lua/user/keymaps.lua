-- Easier way to enter command mode
lvim.keys.normal_mode[";"] = { ":", { noremap = true, silent = false } }
lvim.keys.visual_mode[";"] = { ":", { noremap = true, silent = false } }

-- Easier way to switch between buffers
lvim.keys.normal_mode["<TAB>"] = { ":BufferLineCycleNext<CR>", { noremap = true, silent = true } }
lvim.keys.normal_mode["<S-TAB>"] = { ":BufferLineCyclePrev<CR>", { noremap = true, silent = true } }

-- Fix jumplist navigation
lvim.keys.normal_mode["<C-p>"] = { "<C-o>", { noremap = true, silent = true } }
lvim.keys.normal_mode["<C-n>"] = { "<C-i>", { noremap = true, silent = true } }

-- U = undo
lvim.keys.normal_mode["U"] = { "<C-r>", { noremap = true, silent = true } }

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

-- Enable more which-key mappings
lvim.builtin.which_key.setup.plugins.marks = true
lvim.builtin.which_key.setup.plugins.registers = true
lvim.builtin.which_key.setup.plugins.presets = {
  operators = true,
  motions = true,
  text_objects = true,
  windows = true,
  nav = true,
  z = true,
  g = true,
}

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

-- Toggle relative line numbers
lvim.builtin.which_key.mappings["r"] = {
  name = "Line",
  n = { "<cmd>set relativenumber!<cr>", "Toggle relative line numbers" },
}

-- Modify telescope mappings
local actions = require("lvim.utils.modules").require_on_exported_call("telescope.actions")
lvim.builtin.telescope.defaults.mappings.i["<Tab>"] = actions.move_selection_next
lvim.builtin.telescope.defaults.mappings.i["<S-Tab>"] = actions.move_selection_previous
lvim.builtin.telescope.defaults.mappings.n["<Tab>"] = actions.move_selection_next
lvim.builtin.telescope.defaults.mappings.n["<S-Tab>"] = actions.move_selection_previous
