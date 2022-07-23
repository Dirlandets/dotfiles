if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

    Plug 'mhinz/vim-startify'
    Plug 'dense-analysis/ale'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/plenary.nvim'

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
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    Plug 'tanvirtin/monokai.nvim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

    " Statusbar
    Plug 'feline-nvim/feline.nvim'

    " Nvim tree
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'

    " Bufferline
    Plug 'akinsho/bufferline.nvim'

    " GitSigns installation
    Plug 'lewis6991/gitsigns.nvim'

    " Toggle comments
    Plug 'numToStr/Comment.nvim'

    Plug 'windwp/nvim-ts-autotag'
    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

    Plug 'SmiteshP/nvim-gps'
    Plug 'nvim-orgmode/orgmode'

    " Telescope
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'AckslD/nvim-neoclip.lua'

    " Telescope Neoclip
    Plug 'AckslD/nvim-neoclip.lua'

    " LSP Extensions
    Plug 'nvim-lua/lsp_extensions.nvim'

    " LSP Lines
    Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
call plug#end()
