local null_ls = require('null-ls')

local sources = {
  null_ls.builtins.diagnostics.mypy.with({
    timeout = 60000,
  }),
  null_ls.builtins.diagnostics.flake8.with({
    timeout = 60000,
  }),
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.hadolint,
  -- Codeactions
  null_ls.builtins.code_actions.eslint_d,
  -- Formatters
  null_ls.builtins.formatting.isort,
  null_ls.builtins.formatting.rustfmt,
}
null_ls.setup {
  cmd = { "nvim" },
  debounce = 600,
  debug = false,
  default_timeout = 10000,
  diagnostic_config = nil,
  diagnostics_format = "#{s}: [#{c}] #{m}",
  fallback_severity = vim.diagnostic.severity.ERROR,
  log_level = "warn",
  notify_format = "[null-ls] %s",
  on_attach = nil,
  on_init = nil,
  on_exit = nil,
  root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
  update_in_insert = false,
  sources = sources,
}
