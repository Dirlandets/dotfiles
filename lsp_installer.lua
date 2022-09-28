local lsp_installer = require("nvim-lsp-installer")
local opts = { noremap = true, silent = false }

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

vim.diagnostic.config({
  virtual_text = false,
})

function common_on_attach(_, bufnr)
  ----  add your code here
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local diagnostics_on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local diagnostics_opts = {
  filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss',
    'markdown', 'pandoc' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 200,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${code} ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'eslint_d',
      javascriptreact = 'eslint_d',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      typescript = 'eslint_d',
      typescriptreact = 'eslint_d',
      markdown = 'prettier',
    }
  }
}

local python_opts = {
  pyton = {
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "workspace",
      useLibraryCodeForTypes = true
    }
  }
}

local navic = require("nvim-navic")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  local sn = server.name
  if sn == "eslint" then
    opts.on_attach = function(client, bufnr)
      -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
      -- the resolved capabilities of the eslint server ourselves!
      client.resolved_capabilities = {
        document_formating = true,
      }
      vim.api.nvim_command('augroup Format')
      vim.api.nvim_command('autocmd! * <buffer>')
      vim.api.nvim_command('autocmd BufWritePre <buffer> lua vim.lsp.buf.format(nil, 200)')
      vim.api.nvim_command('augroup END')

      common_on_attach(client, bufnr)
    end
    opts.settings = {
      format = { enable = true }, -- this will enable formatting
    }
  elseif sn == "tsserver" then
    vim.api.nvim_command('autocmd BufWritePre *.tsx lua vim.lsp.buf.format(nil, 100)')
    vim.api.nvim_command('autocmd BufWritePre *.jsx lua vim.lsp.buf.format(nil, 100)')
    vim.api.nvim_command('autocmd BufWritePre *.ts lua vim.lsp.buf.format(nil, 100)')
    vim.api.nvim_command('autocmd BufWritePre *.js lua vim.lsp.buf.format(nil, 100)')
    opts.on_attach = function(client, bufnr)
      common_on_attach(client, bufnr)
      navic.attach(client, bufnr)
    end
  elseif sn == 'rust_analyzer' then
    vim.api.nvim_command('autocmd BufWritePre *.rs lua vim.lsp.buf.format(nil, 100)')
    opts.on_attach = function(client, bufnr)
      common_on_attach(client, bufnr)
      navic.attach(client, bufnr)
    end
  elseif sn == 'pyright' then
    opts = python_opts
    opts.on_attach = function(client, bufnr)
      common_on_attach(client, bufnr)
      navic.attach(client, bufnr)
    end
  elseif sn == 'sumneko_lua' then
    vim.api.nvim_command('autocmd BufWritePre *.lua lua vim.lsp.buf.format(nil, 100)')
    opts.on_attach = function(client, bufnr)
      common_on_attach(client, bufnr)
      navic.attach(client, bufnr)
    end
  else
    opts.on_attach = common_on_attach
  end
  server:setup(opts)
end)
