if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

    Plug 'lewis6991/impatient.nvim'
    Plug 'mhinz/vim-startify'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/plenary.nvim'

    " Closes brackets automaticaly
    Plug 'windwp/nvim-autopairs'

    " Helper for better buffers expirience
    Plug 'moll/vim-bbye'

    " Completion plugins
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'williamboman/nvim-lsp-installer'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'

    " Color schemas
    " Plug 'kaicataldo/material.vim', { 'branch': 'main' }
    " Plug 'tanvirtin/monokai.nvim'
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

    Plug 'nvim-orgmode/orgmode'

    " Telescope
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'AckslD/nvim-neoclip.lua'

    " LSP Extensions
    Plug 'nvim-lua/lsp_extensions.nvim'

    " LSP Lines
    Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

    " LSP null-lsp
    Plug 'https://github.com/jose-elias-alvarez/null-ls.nvim'

    " LSP statusline/winbar component that uses LSP
    Plug 'SmiteshP/nvim-navic'

    Plug 's1n7ax/nvim-window-picker'

    " Plug 'easymotion/vim-easymotion'
    Plug 'phaazon/hop.nvim'

    " Switch bools
    Plug 'nat-418/boole.nvim'

    " Noice
    Plug 'folke/noice.nvim'
    Plug 'MunifTanjim/nui.nvim'
    Plug 'rcarriga/nvim-notify'

call plug#end()
