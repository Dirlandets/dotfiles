require("null-ls").setup {
  diagnostics_format = "#{s}: [#{c}] #{m}",
  source = {
    require("null-ls").builtins.diagnostics.mypy,
    require("null-ls").builtins.diagnostics.flake8,
    require("null-ls").builtins.diagnostics.eslint_d,
    require("null-ls").builtins.diagnostics.hadolint,
  }
}
