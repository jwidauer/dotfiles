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
lvim.builtin.which_key.setup.plugins.presets = {
  operators = true,
  motions = true,
  text_objects = true,
  windows = true,
  nav = true,
  z = true,
  g = true,
}

-- Modify telescope mappings
local actions = require("lvim.utils.modules").require_on_exported_call("telescope.actions")
lvim.builtin.telescope.defaults.mappings.i["<Tab>"] = actions.move_selection_next
lvim.builtin.telescope.defaults.mappings.i["<S-Tab>"] = actions.move_selection_previous
lvim.builtin.telescope.defaults.mappings.n["<Tab>"] = actions.move_selection_next
lvim.builtin.telescope.defaults.mappings.n["<S-Tab>"] = actions.move_selection_previous

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
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end
  },
  {
    "tpope/vim-surround",
  },
  {
    "gelguy/wilder.nvim",
    build = ":UpdateRemotePlugins",
    dependencies = {
      {
        "romgrk/fzy-lua-native",
        build = "make",
      }
    },
    event = "CmdlineEnter",
    config = function()
      local wilder = require('wilder')
      wilder.setup({ modes = { ':', '/', '?' } })

      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.python_file_finder_pipeline({
            file_command = function(ctx, arg)
              if string.find(arg, '.') ~= nil then
                return { 'fdfind', '-tf', '-H' }
              else
                return { 'fdfind', '-tf' }
              end
            end,
            dir_command = { 'fd', '-td' },
            filters = { 'cpsm_filter' },
          }),
          wilder.substitute_pipeline({
            pipeline = wilder.python_search_pipeline({
              skip_cmdtype_check = 1,
              pattern = wilder.python_fuzzy_pattern({
                start_at_boundary = 0,
              }),
            }),
          }),
          wilder.cmdline_pipeline({
            fuzzy = 2,
            fuzzy_filter = wilder.lua_fzy_filter(),
          }),
          {
            wilder.check(function(ctx, x) return x == '' end),
            wilder.history(),
          },
          wilder.python_search_pipeline({
            pattern = wilder.python_fuzzy_pattern({
              start_at_boundary = 0,
            }),
          })
        ),
      })

      local highlighters = {
        wilder.pcre2_highlighter(),
        wilder.lua_fzy_highlighter(),
      }

      local popupmenu_renderer = wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
          border = 'rounded',
          empty_message = wilder.popupmenu_empty_message_with_spinner(),
          highlighter = highlighters,
          left = {
            ' ',
            wilder.popupmenu_devicons(),
            wilder.popupmenu_buffer_flags({
              flags = ' a + ',
              icons = { ['+'] = '', a = '', h = '' },
            }),
          },
          right = {
            ' ',
            wilder.popupmenu_scrollbar(),
          },
        })
      )

      local wildmenu_renderer = wilder.wildmenu_renderer({
        highlighter = highlighters,
        separator = ' · ',
        left = { ' ', wilder.wildmenu_spinner(), ' ' },
        right = { ' ', wilder.wildmenu_index() },
      })

      wilder.set_option('renderer', wilder.renderer_mux({
        [':'] = popupmenu_renderer,
        ['/'] = wildmenu_renderer,
        substitute = wildmenu_renderer,
      }))
    end
  }
}

---- LSP
-- Special setup for clangd
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
local capabilities = require("lvim.lsp").common_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lvim.lsp.manager").setup("clangd", { capabilities = capabilities })

---- Formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    exe = "black",
    filetypes = { "python" },
  },
})

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
