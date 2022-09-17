set mouse=a  " enable mouse
set encoding=utf-8
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

set lazyredraw
set synmaxcol=128
syntax sync minlines=256

set list
set listchars=tab:>-,trail:⎵,nbsp:⎵
:set timeoutlen=300

" true color
" termguicolor breaks the colors fix later
if (has('termguicolors'))
  set termguicolors
endif

runtime ./plug.vim
lua require('impatient')
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif
runtime ./maps.lua
runtime ./telescope.lua
runtime ./cmp.lua
runtime ./nvim_tree.vim
runtime ./bufferline.lua
runtime ./comment.lua
runtime ./treesitter.lua
runtime ./feline.lua
runtime ./gitsigns.lua
runtime ./null-ls.lua
runtime ./lsp_installer.lua
runtime ./ts_autotag.lua
runtime ./mkdp_config.vim
runtime ./orgmode.lua
runtime ./neoclip.lua
runtime ./lsp_lines.lua
runtime ./navic.lua
runtime ./nvim-autopairs.lua
runtime ./trouble.lua
runtime ./mind.lua
runtime ./saga.lua
runtime ./hop.lua
"}}}

" colorscheme monokai
" colorscheme monokai_pro
" colorscheme monokai_soda
" colorscheme monokai_ristretto
" tokionight
let g:tokyonight_style = "night"
let g:tokyonight_transparent = 0
colorscheme tokyonight
