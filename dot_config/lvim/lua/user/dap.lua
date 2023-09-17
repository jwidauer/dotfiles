local dap = require("dap")

-- Add adapters
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  -- Install 'cpptools' from mason
  command = vim.fn.expand("$MASON/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7"),
  options = {
    detached = false
  }
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
  }
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
