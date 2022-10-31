-- It's important that you set up the plugins in the following order:
--
-- mason.nvim
-- null-ls
-- mason-null-ls.nvim
local null_ls = require('null-ls')

local sources = {
  null_ls.builtins.diagnostics.mypy.with({
    only_local = true,
  }),
  null_ls.builtins.diagnostics.flake8.with({
    prefer_local = true,
  }),
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.hadolint,
  -- Codeactions
  null_ls.builtins.code_actions.eslint_d,
  -- Formatters
  null_ls.builtins.formatting.isort.with({
    only_local = true,
  }),

}
null_ls.setup({
  cmd = { "nvim" },
  debounce = 250,
  debug = false,
  default_timeout = 5000,
  diagnostic_config = nil,
  diagnostics_format = "#{s}: [#{c}] #{m}",
  fallback_severity = vim.diagnostic.severity.ERROR,
  log_level = "warn",
  notify_format = "[null-ls] %s",
  on_attach = nil,
  on_init = nil,
  on_exit = nil,
  root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
  sources = sources,
  update_in_insert = false,
})
-- require("mason-null-ls").setup({
--   ensure_installed = { "stylua", "jq", "flake8", "mypy" }
-- })
