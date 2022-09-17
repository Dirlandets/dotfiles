NullLs = require("null-ls")
NullLs.sources = {
  NullLs.builtins.diagnostics.mypy,
  NullLs.builtins.diagnostics.flake8,
  NullLs.builtins.diagnostics.eslint_d,
  NullLs.builtins.diagnostics.hadolint,
}
NullLs.diagnostics_format = "#{s}: [#{c}] #{m}"
