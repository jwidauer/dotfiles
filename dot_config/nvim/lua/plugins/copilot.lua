return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "User AstroFile",
  opts = {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = false,
      },
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            ai_inline = true,
            ai_accept = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept()
                return true
              end
            end,
          },
        },
      },
    },
    {
      "Saghen/blink.cmp",
      optional = true,
      opts = function(_, opts)
        if not opts.keymap then opts.keymap = {} end
        opts.keymap["<A-l>"] = {
          "snippet_forward",
          function()
            if vim.g.ai_accept then return vim.g.ai_accept() end
          end,
          "fallback",
        }
        opts.keymap["<A-h>"] = { "snippet_backward", "fallback" }
      end,
    },
  },
}
