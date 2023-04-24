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

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)


keymap("n", "tr", ":set relativenumber!<CR>", opts)

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
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
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

-- keymap('n', '<space>de', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '<space>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', '<space>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<space>dl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
keymap('n', '<space>df', '<cmd>lua vim.lsp.buf.format {async = true}<CR>', opts)

keymap('n', '<space>bb', ':buffers<CR>', opts)
keymap('n', '<space>ww', ':windows<CR>', opts)

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

-- Outline
keymap("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

-- Hop
keymap('', 'ff',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>"
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
-- keymap('n', '<space>tt', '<cmd>NvimTreeToggle<CR>', opts)
keymap('n', '<space>tt', '<cmd>CHADopen<CR>', opts)

vim.keymap.set({ 'n', 'v' }, '<space>tl', function()
  vim.api.nvim_command("colorscheme catppuccin-latte")
end, opts)

vim.keymap.set({ 'n', 'v' }, '<space>td', function()
  vim.api.nvim_command("colorscheme tokyonight")
end, opts)
