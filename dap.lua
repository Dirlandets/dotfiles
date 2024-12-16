local dap = require("dap")
dap.set_log_level("TRACE")

local dapui = require("dapui")

local dp_path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"

require('dap-python').setup(dp_path)
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
