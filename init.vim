lua << EOF
  vim.g.loaded = 1
  vim.g.loaded_netrwPlugin = 1
EOF
let g:coq_settings = { 'auto_start': 'shut-up' }
set number
set noswapfile
set scrolloff=7
set title
" set autoindent
set background=dark
set ignorecase

set splitright
set splitbelow
syntax enable

set tabstop=2
set softtabstop=2
set shiftwidth=2

set expandtab
set smarttab
set autoindent
set fileformat=unix
set colorcolumn=80
set cursorline
set clipboard+=unnamedplus

set nobackup
set backupskip=/tmp/*,/private/tmp/*
filetype indent on      " load filetype-specific indent files

" set lazyredraw
set synmaxcol=128
syntax sync minlines=256

set list
set listchars=tab:>-,trail:⎵,nbsp:⎵
:set timeoutlen=300

set number relativenumber
set nu rnu

" true color
" termguicolor breaks the colors fix later
if (has('termguicolors'))
  set termguicolors
endif
" https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#tips-for-using-pyenv

runtime ./plug.vim
lua require('impatient')
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif
runtime ./colors/tokionight.lua
runtime ./colors/catppuccin.lua
runtime ./maps.lua
runtime ./nvim_tree.lua
runtime ./treesitter.lua
runtime ./diagnostics.lua
runtime ./bufferline.lua
runtime ./feline.lua

" LSP stuff
runtime ./lsp/lsp_installer.lua
runtime ./lsp/navic.lua
runtime ./lsp/init.lua
runtime ./lsp/null_ls.lua
runtime ./lsp/lsp_lines.lua
runtime ./lsp/saga.lua

runtime ./telescope.lua
runtime ./neoclip.lua
" runtime ./cmp.lua
runtime .coq.lua
runtime ./comment.lua
runtime ./gitsigns.lua
runtime ./ts_autotag.lua
runtime ./mkdp.vim
runtime ./orgmode.lua
runtime ./neoclip.lua
runtime ./nvim-autopairs.lua
runtime ./hop.lua
runtime ./bool.lua
"}}}

colorscheme tokyonight
