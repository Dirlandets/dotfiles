vim.diagnostic.config({
  virtual_text = false,
  float = {
    show_header = true,
    format = function(diagnostic)
      return string.format('%s\n%s: %s', diagnostic.source, diagnostic.code, diagnostic.message)
    end,
  },
})
