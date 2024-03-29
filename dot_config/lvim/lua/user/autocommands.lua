local wk = require("which-key")

lvim.autocommands = {
  {
    "FileType", {
    pattern = "*",
    callback = function()
      local ft = vim.api.nvim_buf_get_option(0, "filetype")
      local opts = { buffer = vim.api.nvim_get_current_buf() }

      if ft == 'cpp' or ft == 'c' then
        wk.register({
          ['go'] = { '<cmd>ClangdSwitchSourceHeader<cr>', 'Switch between source/header' },
        }, opts)
      end
    end
  }
  }
}
