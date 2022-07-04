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
    Plug 'glepnir/lspsaga.nvim'
    Plug 'williamboman/nvim-lsp-installer'

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

    " GitSigns installation
    Plug 'nvim-lua/plenary.nvim'
    Plug 'lewis6991/gitsigns.nvim'

    " Toggle comments
    Plug 'numToStr/Comment.nvim'

    Plug 'windwp/nvim-ts-autotag'
    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    " LSP Extensions
    Plug 'nvim-lua/lsp_extensions.nvim'
call plug#end()
