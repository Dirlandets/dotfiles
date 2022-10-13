local null_ls = require('null-ls')

local sources = {
  null_ls.builtins.diagnostics.mypy,
  null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.hadolint,
  -- Codeactions
  null_ls.builtins.code_actions.eslint_d,
  -- Formatters
  null_ls.builtins.formatting.isort,
  null_ls.builtins.formatting.rustfmt,
}
null_ls.setup({
  diagnostics_format = "#{s}: [#{c}] #{m}",
  debug = true,
  sources = sources,
})
