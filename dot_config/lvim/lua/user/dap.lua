local dap = require("dap")

-- Add adapters
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/jakob/.local/bin/open_debug/OpenDebugAD7'
}

-- Add configurations
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    setupCommands = {
      {
        description = "Enable pretty-printing for gdb",
        text = "-enable-pretty-printing",
        ignoreFailures = false
      }
    }
  },
}
