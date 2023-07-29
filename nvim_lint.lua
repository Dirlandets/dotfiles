require('lint').linters_by_ft = {
  markdown = { 'vale', },
  python = { 'ruff', 'mypy' }
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufRead", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
