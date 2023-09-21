-- For copilot.vim
-- vim.g.copilot_filetypes = {
--   ["*"] = false,
-- }

-- vim.cmd [[
--   imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
--   let g:copilot_no_tab_map = v:true
-- ]]
local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  print("Copilot does not work!")
  return
end


copilot.setup({
  cmp = {
    enabled = false,
    method = "getCompletionsCycling",
  },
  panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4,
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 70,
    keymap = {
      accept = "<M-a>",
      accept_word = "<M-w>",
      accept_line = "<M-l>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = true,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
})
