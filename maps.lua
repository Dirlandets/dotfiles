local opts = { noremap = true, silent = false }
-- Shorten nvim_set_keymap name
local keymap = vim.api.nvim_set_keymap

-- Remap leader key to space
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "
-- Close buffer
keymap("n", "gw", "<cmd>Bdelete<CR>", opts)
keymap("i", "gw", "<cmd>Bdelete<CR>", opts)
keymap("v", "gw", "<cmd>Bdelete<CR>", opts)


-- line or visually selected block - alt+j/k
-- TODO: Alt does not work
-- inoremap <A-j> <Esc>:m .+1<CR>==gi
-- inoremap <A-k> <Esc>:m .-2<CR>==gi
-- vnoremap <A-j> :m '>+1<CR>gv=gv
-- vnoremap <A-k> :m '<-2<CR>gv=gv
-- move split panes to left/bottom/top/right
keymap("n", "<A-h>", "<C-W>h", opts)
keymap("n", "<A-j>", "<C-W>j", opts)
keymap("n", "<A-k>", "<C-W>k", opts)
keymap("n", "<A-l>", "<C-W>l", opts)
-- move between panes to left/bottom/top/right
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- Press i to enter insert mode, and jk(kj) to exit insert mode.
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in ident mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Apply macro over visual range
keymap('x', '@', '":norm @" . getcharstr() . "<cr>"', { expr = true, silent = false, noremap = true })
-- Press i to enter insert mode, and ii to exit insert mode.
-- :vnoremap jk <Esc>
-- :vnoremap kj <Esc>
-- LSPSAGA
-- keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
-- keymap("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)
-- keymap("n", "<F2>", ":<C-U>Lspsaga rename<CR>", opts)
-- keymap("v", "<F2>", ":<C-U>Lspsaga rename<CR>", opts)

-- keymap('n', '<space>de', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '<space>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', '<space>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<space>dl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
keymap('n', '<space>df', '<cmd>lua vim.lsp.buf.format {async = true}<CR>', opts)

keymap('n', '<space>bb', ':Buffers<CR>', opts)
keymap('n', '<space>ww', ':Windows<CR>', opts)
keymap('n', '<space>bb', ':Buffers<CR>', opts)
keymap('n', '<space>ww', ':Windows<CR>', opts)

keymap('n', '<space>]', ':BufferLineMoveNext<CR>', opts)
keymap('n', '<space>[', ':BufferLineMovePrev<CR>', opts)

-- TELESCOPE
keymap('n', '<space>ff', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<space>fg', '<cmd>Telescope live_grep<cr>', opts)
keymap('n', '<space>fb', '<cmd>Telescope buffers<cr>', opts)
keymap('n', '<space>fp', '<cmd>Telescope neoclip<cr>', opts)
keymap('v', '<space>fp', '<cmd>Telescope neoclip<cr>', opts)

-- LSP LINES
keymap('n', "<space>ll", '<cmd>lua require("lsp_lines").toggle()<CR>', opts)

-- Truuble
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

-- LSP SAGA
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)

-- Code action
keymap("n", "<space>ca", "<cmd>Lspsaga code_action<CR>", opts)
keymap("v", "<space>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)

-- Rename
keymap("n", "<F2>", "<cmd>Lspsaga rename<CR>", opts)

-- Definition preview
keymap("n", "<leader>gd", "<cmd>Lspsaga preview_definition<CR>", opts)

-- Show line diagnostics
keymap("n", "<space>de", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)


-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

-- Only jump to error
-- keymap("n", "[E", function()
--   require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end, { silent = true })
-- keymap("n", "]E", function()
--   require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end, { silent = true })

-- Outline
keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

-- Hop
keymap('', 'f',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
  , opts)
keymap('', 'ff',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>"
  , opts)
keymap('', 'F',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
  , opts)
keymap('', 'FF',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>"
  , opts)
keymap('', 'tt',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<cr>"
  , opts)
keymap('', 'TT',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>"
  , opts)
keymap('', '<space><space>', "<cmd>lua require'hop'.hint_char2({})<cr>", opts)
keymap('', '<space>l', "<cmd>HopLineStart<cr>", opts)

-- NvimTree
keymap('n', '<space>tt', '<cmd>NvimTreeToggle<CR>', opts)
