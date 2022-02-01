if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

    Plug 'mhinz/vim-startify'
    Plug 'dense-analysis/ale'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'cohama/lexima.vim'  " Closes brackest automaticaly
    " Completion plugins
    Plug 'neovim/nvim-lspconfig' 
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'
    " Color schemas
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    Plug 'tanvirtin/monokai.nvim'
    
    " Best statusbar for nvim
    Plug 'feline-nvim/feline.nvim'

    " Nvim tree requires
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'

    " Fzf settings
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
call plug#end()

