local M = {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = { "BufReadPre " .. vim.fn.expand "~" .. "/j-vault/**.md" },
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    dir = "~/j-vault",

    daily_notes = {
      folder = "Daily Notes",
    },

    completion = {
      nvim_cmp = true,
    },

    mappings = {
      ["gf"] = require("obsidian.mapping").gf_passthrough(),
    }
  },
}

return M
