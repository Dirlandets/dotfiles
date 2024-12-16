local uv = vim.loop
local dap = require('dap')
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch',
    name = "Launch file",

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}", -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end,
  },
}
-- require("dap-python").resolve_python = function()
--   -- Helper function to check if a file exists
--   local function file_exists(filepath)
--     local stat = uv.fs_stat(filepath)
--     return stat and stat.type == "file" or false
--   end
--
--   -- Helper function to resolve the Python path
--   local function resolve_python_path()
--     local cwd = vim.fn.getcwd()
--     local config_file = cwd .. "/pyrightconfig.json"
--
--     -- If the pyrightconfig.json exists
--     if file_exists(config_file) then
--       local file = io.open(config_file, "r")
--       -- Check if file is not nill
--       if not file then
--         vim.notify("Failed to open pyrightconfig.json", vim.log.levels.ERROR)
--         return nil
--       end
--       local content = file:read("*all")
--       file:close()
--
--       -- Parse JSON
--       local success, config = vim.fn.json_decode(content)
--       if success and config.venv and config.venvPath then
--         local python_path = config.venvPath .. "/" .. config.venv .. "/bin/python"
--         if file_exists(python_path) then
--           return python_path
--         else
--           vim.notify("Python interpreter not found in " .. python_path, vim.log.levels.WARN)
--         end
--       else
--         vim.notify("Failed to parse pyrightconfig.json", vim.log.levels.ERROR)
--       end
--     end
--
--     -- Fallback to default Python
--     local default_python = "/usr/bin/python"
--     if file_exists(default_python) then
--       return default_python
--     else
--       vim.notify("Default Python interpreter not found.", vim.log.levels.ERROR)
--       return nil
--     end
--   end
--
--   -- Resolve and return the Python path
--   return resolve_python_path()
-- end
