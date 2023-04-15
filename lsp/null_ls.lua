local null_ls = require('null-ls')

local sources = {
  null_ls.builtins.diagnostics.mypy.with({
    timeout = 60000,
  }),
  null_ls.builtins.diagnostics.flake8.with({
    timeout = 60000,
  }),
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.ruff,
  -- null_ls.builtins.diagnostics.ruff.with({
  --   command = "docker",
  --   args = {
  --     "run",
  --     "-v",
  --     string.format(
  --       "%s:/pyproject.toml",
  --       vim.fn.expand(string.format("%s/pyproject.toml", vim.env.PWD))
  --     ),
  --     "--rm",
  --     "-i",
  --     "--entrypoint",
  --     "ruff",
  --     "ruff:latest",
  --     "--config",
  --     "/pyproject.toml",
  --     "-n",
  --     "-e",
  --     "--stdin-filename",
  --     "$FILENAME",
  --     "-"
  --   },
  --   -- extra_args = {
  --   --   "-v",
  --   --   string.format(
  --   --     "%s:/pyproject.toml",
  --   --     vim.fn.expand("./pyproject.toml")
  --   --   )
  --   -- },
  -- }),
  null_ls.builtins.formatting.ruff,
  -- null_ls.builtins.formatting.ruff.with({
  --   command = "docker",
  --   args = {
  --     "run",
  --     "-v",
  --     string.format(
  --       "%s:/pyproject.toml",
  --       vim.fn.expand(string.format("%s/pyproject.toml", vim.env.PWD))
  --     ),
  --     "--rm",
  --     "-i",
  --     "--entrypoint",
  --     "ruff",
  --     "ruff:latest",
  --     "--config",
  --     "/pyproject.toml",
  --     "-n",
  --     "-e",
  --     "--stdin-filename",
  --     "$FILENAME",
  --     "--fix",
  --     "-"
  --   },
  --   -- extra_args = {
  --   --   "-v",
  --   --   string.format(
  --   --     "%s:/pyproject.toml",
  --   --     vim.fn.expand("./pyproject.toml")
  --   --   )
  --   -- },
  -- }),
  null_ls.builtins.diagnostics.hadolint.with({
    command = "docker",
    args = { "run", "--rm", "-i", "--entrypoint", "/bin/hadolint", "hadolint/hadolint", "--no-fail", "--format=json", "-" }
  }),
  -- Codeactions
  null_ls.builtins.code_actions.eslint_d,
  -- Formatters
  null_ls.builtins.formatting.ruff,
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.formatting.eslint_d,
}
null_ls.setup {
  cmd = { "nvim" },
  debounce = 800,
  debug = true,
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
