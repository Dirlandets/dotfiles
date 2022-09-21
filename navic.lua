local navic = require("nvim-navic")

require("lspconfig").pyright.setup {
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end
}

navic.setup {
  icons = {
    File          = " ",
    Module        = " ",
    Namespace     = " ",
    Package       = " ",
    Class         = " ",
    Method        = " ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "練",
    Interface     = "練",
    Function      = " ",
    Variable      = " ",
    Constant      = " ",
    String        = " ",
    Number        = " ",
    Boolean       = "◩ ",
    Array         = " ",
    Object        = " ",
    Key           = " ",
    Null          = "ﳠ ",
    EnumMember    = " ",
    Struct        = " ",
    Event         = " ",
    Operator      = " ",
    TypeParameter = " ",
  },
  highlight = true,
  separator = " | ",
  depth_limit = 0,
  depth_limit_indicator = "..",
}
vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "", fg = "#565f89" })
vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "", fg = "#565f89" })
vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, bg = "", fg = "#7dcfff" })
vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, bg = "", fg = "#bb9af7" })
vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, bg = "", fg = "#bb9af7" })
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
