-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["<TAB>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-TAB>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- Easier way to enter command mode
        [";"] = { ":" },

        -- Fix jumplist navigation
        ["<C-p>"] = { "<C-o>" },
        ["<C-n>"] = { "<C-i>" },

        -- U = undo
        ["U"] = { "<C-r>" },

        -- Helix style navigation
        ["gh"] = { "0", desc = "Goto start of line" },
        ["gs"] = { "^", desc = "Goto start of line (non-blank)" },
        ["gl"] = { "$", desc = "Goto end of line" },
        ["ge"] = { "G", desc = "Goto last line" },

        -- Toggle relative line numbers
        ["<Leader>rn"] = { "<cmd>set relativenumber!<cr>", desc = "Toggle relative line numbers" },

        -- Toggle terminal
        ["<A-1>"] = { "<cmd>ToggleTerm size=15 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
        ["<A-2>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" },
        ["<A-3>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },

        -- Move current line / block with Alt-j/k a la vscode.
        ["<A-j>"] = ":m .+1<CR>==",
        ["<A-k>"] = ":m .-2<CR>==",

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      v = {
        -- Easier way to enter command mode
        [";"] = { ":" },
        --
        -- Helix style navigation
        ["gh"] = { "0", desc = "Goto start of line" },
        ["gs"] = { "^", desc = "Goto start of line (non-blank)" },
        ["gl"] = { "$", desc = "Goto end of line" },
        ["ge"] = { "G", desc = "Goto last line" },

        -- Format selection
        ["<Leader>i"] = { vim.lsp.buf.format, desc = "Format selection" },
      },
      x = {
        -- Move current line / block with Alt-j/k ala vscode.
        ["<A-j>"] = ":m '>+1<CR>gv-gv",
        ["<A-k>"] = ":m '<-2<CR>gv-gv",
      },
      i = {
        -- Navigate in insert mode
        ["<C-h>"] = { "<Left>" },
        ["<C-j>"] = { "<Down>" },
        ["<C-k>"] = { "<Up>" },
        ["<C-l>"] = { "<Right>" },

        -- Move current line / block with Alt-j/k ala vscode.
        ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
        -- Move current line / block with Alt-j/k ala vscode.
        ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
      },
      t = {
        ["<A-1>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
        ["<A-2>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
        ["<A-3>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      },
    },
  },
}
