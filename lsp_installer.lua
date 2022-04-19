local lsp_installer = require("nvim-lsp-installer")
local opts = { noremap=true, silent=false}

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})


function common_on_attach(client, bufnr)
  -- add your code here
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.dclaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local diagnostics_on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local diagnostics_opts = {
  filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
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
      json = 'prettier',
      markdown = 'prettier',
    }
  }
}

python_opts = {
  pyton = {
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "workspace",
      useLibraryCodeForTypes = true
    }
  }
}

lsp_installer.on_server_ready(function (server)
    local opts = {}

    if server.name == "eslint" then
        opts.on_attach = function (client, bufnr)
            -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
            -- the resolved capabilities of the eslint server ourselves!
            client.resolved_capabilities.document_formatting = true
            vim.api.nvim_command('augroup Format')
            vim.api.nvim_command('autocmd! * <buffer>')
            vim.api.nvim_command('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync(nil, 200)')
            vim.api.nvim_command('augroup END')

            common_on_attach(client, bufnr)
        end
        opts.settings = {
            format = { enable = true }, -- this will enable formatting
        }
    elseif server.name == "tsserver" then
        vim.api.nvim_command('autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_seq_sync(nil, 200)')
        vim.api.nvim_command('autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_seq_sync(nil, 200)')
        vim.api.nvim_command('autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_seq_sync(nil, 200)')
        vim.api.nvim_command('autocmd BufWritePre *.js lua vim.lsp.buf.formatting_seq_sync(nil, 200)')
        opts.on_attach = function(client, bufnr)
            common_on_attach(client, bufnr)
        end
    elseif server.name == 'diagnosticls' then
        opts = diagnostics_opts
        opts.on_attach = function(client, bufnr)
            common_on_attach(client, bufnr)
            diagnostics_on_attach(client, bufnr)
        end
    elseif server.name == 'rust_analyzer' then
        vim.api.nvim_command('autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)')
        opts.on_attach = function(client, bufnr)
            common_on_attach(client, bufnr)
        end
    elseif server.name == 'pyright' then
        opts = python_opts
        opts.on_attach = function(client, bufnr)
            common_on_attach(client, bufnr)
        end
    else
        opts.on_attach = common_on_attach
    end
    server:setup(opts)
end)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 3,
      prefix = ''
    }
  }
)
