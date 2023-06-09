local dap = require("dap")

-- Add adapters
dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode-14",
  name = "lldb",
}

-- Add configurations
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}
