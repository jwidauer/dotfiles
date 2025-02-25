-- Easier way to enter command mode
lvim.keys.normal_mode[";"] = { ":", { noremap = true, silent = false } }
lvim.keys.visual_mode[";"] = { ":", { noremap = true, silent = false } }

local opts = { noremap = true, silent = true }
-- Easier way to switch between buffers
lvim.keys.normal_mode["<TAB>"] = { ":BufferLineCycleNext<CR>", opts }
lvim.keys.normal_mode["<S-TAB>"] = { ":BufferLineCyclePrev<CR>", opts }

-- Fix jumplist navigation
lvim.keys.normal_mode["<C-p>"] = { "<C-o>", opts }
lvim.keys.normal_mode["<C-n>"] = { "<C-i>", opts }

-- U = undo
lvim.keys.normal_mode["U"] = { "<C-r>", opts }

-- Navigate in insert mode
lvim.keys.insert_mode["<C-h>"] = { "<Left>", opts }
lvim.keys.insert_mode["<C-j>"] = { "<Down>", opts }
lvim.keys.insert_mode["<C-k>"] = { "<Up>", opts }
lvim.keys.insert_mode["<C-l>"] = { "<Right>", opts }

-- Helix style navigation
-- normal
lvim.lsp.buffer_mappings.normal_mode["gh"] = { "0", "Goto start of line" }
lvim.lsp.buffer_mappings.normal_mode["gs"] = { "^", "Goto start of line (non-blank)" }
lvim.lsp.buffer_mappings.normal_mode["gl"] = { "$", "Goto end of line" }
lvim.lsp.buffer_mappings.normal_mode["ge"] = { "G", "Goto last line" }
lvim.keys.normal_mode["gh"] = { "0", opts }
lvim.keys.normal_mode["gs"] = { "^", opts }
lvim.keys.normal_mode["gl"] = { "$", opts }
lvim.keys.normal_mode["ge"] = { "G", opts }
-- visual
lvim.lsp.buffer_mappings.visual_mode["gh"] = { "0", "Start of line" }
lvim.lsp.buffer_mappings.visual_mode["gs"] = { "^", "Start of line (non-blank)" }
lvim.lsp.buffer_mappings.visual_mode["gl"] = { "$", "End of line" }
lvim.lsp.buffer_mappings.visual_mode["ge"] = { "G", "Last line" }
lvim.keys.visual_mode["gh"] = { "0", opts }
lvim.keys.visual_mode["gs"] = { "^", opts }
lvim.keys.visual_mode["gl"] = { "$", opts }
lvim.keys.visual_mode["ge"] = { "G", opts }

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
  t = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer" },
  w = { "<cmd>Trouble diagnostics toggle<cr>", "Workspace" },
  q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix" },
  l = { "<cmd>Trouble loclist toggle<cr>", "Location list" },
  r = { "<cmd>Trouble lsp_references toggle<cr>", "References" },
  s = { "<cmd>Trouble symbols toggle pinned=true win.relative=win win.position=right<cr>", "Symbols" }
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

lvim.builtin.which_key.vmappings["i"] = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format selection" }
lvim.lsp.buffer_mappings.visual_mode["<leader>i"] = { vim.lsp.buf.format, "Format selection" }
lvim.keys.visual_mode["<leader>i"] = { vim.lsp.buf.format, opts }
