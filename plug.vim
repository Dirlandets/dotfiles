if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

    Plug 'mhinz/vim-startify'
    Plug 'dense-analysis/ale'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Closes brackets automaticaly
    Plug 'cohama/lexima.vim'

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
    
    " Statusbar
    Plug 'feline-nvim/feline.nvim'

    " Nvim tree
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'

    " Fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

    " Bufferline
    Plug 'akinsho/bufferline.nvim'

call plug#end()

