require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
  ensure_installed = {
    "tsx",
    "toml",
    "yaml",
    "html",
    "scss",
    "python",
    "rust",
    "go",
    "lua",
    "regex",
    "bash",
    "markdown",
    "markdown_inline",
    "json",
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection = "gnn",
      node_incnemental = "grn",
      node_decremental = "grm",
      scope_incremental = "grc",
    },
  },
}
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsename = { "javascript", "typescript.tsx" }
