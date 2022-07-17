local opts = { noremap=true, silent=false}
-- Shorten nvim_set_keymap name
local keymap = vim.api.nvim_set_keymap

-- Remap leader key to space
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

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
-- Press i to enter insert mode, and ii to exit insert mode.
-- :vnoremap jk <Esc>
-- :vnoremap kj <Esc>
-- LSPSAGA
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
keymap("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)
keymap("n", "<F2>", ":<C-U>Lspsaga rename<CR>", opts)
keymap("v", "<F2>", ":<C-U>Lspsaga rename<CR>", opts)

keymap('n', '<space>de', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '<space>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', '<space>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<space>dl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
keymap('n', '<space>df', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

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
