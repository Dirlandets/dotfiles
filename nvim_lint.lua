local lint = require('lint')

local pattern = '([^:]+):(%d+):(%d+): (%a+): (.*)'
local groups = { 'file', 'lnum', 'col', 'severity', 'message' }
local severities = {
  error = vim.diagnostic.severity.ERROR,
  warning = vim.diagnostic.severity.WARN,
  note = vim.diagnostic.severity.HINT,
}

lint.linters.dmypy = {
  name = 'dmypy',
  cmd = 'dmypy',
  stdin = false,
  ignore_exitcode = true,
  args = {
    'run',
  },
  parser = require('lint.parser').from_pattern(pattern, groups, severities, { ['source'] = 'dmypy' }),
}

lint.linters_by_ft = {
  python = { 'ruff', 'dmypy' }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require("lint").try_lint()
  end,
})
