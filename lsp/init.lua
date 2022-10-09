local nvim_lsp = require('lspconfig')
local navic = require("nvim-navic")

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

function common_on_attach(client, bufnr)
  vim.api.nvim_buf_set_keymap(
    bufnr, 'n', 'gd',
    '<cmd>lua vim.lsp.buf.definition()<CR>',
    { noremap = true, silent = false }
  )
  navic.attach(client, bufnr)
end

-- RUST
nvim_lsp.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_command('autocmd BufWritePre *.rs lua vim.lsp.buf.format(nil, 100)')
    common_on_attach(client, bufnr)
  end
  ,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
      checkOnSave = {
        command = "clippy"
      },
    }
  }
}

-- LUA
nvim_lsp.sumneko_lua.setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_command('autocmd BufWritePre *.lua lua vim.lsp.buf.format(nil, 100)')
    common_on_attach(client, bufnr)
  end
}

-- PYTHON
nvim_lsp.pyright.setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_command('autocmd BufWritePre *.lua lua vim.lsp.buf.format(nil, 100)')
    common_on_attach(client, bufnr)
  end,
  pyton = {
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "workspace",
      useLibraryCodeForTypes = true
    }
  }
}

-- TS
nvim_lsp.tsserver.setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_command('autocmd BufWritePre *.tsx lua vim.lsp.buf.format(nil, 100)')
    vim.api.nvim_command('autocmd BufWritePre *.jsx lua vim.lsp.buf.format(nil, 100)')
    vim.api.nvim_command('autocmd BufWritePre *.ts lua vim.lsp.buf.format(nil, 100)')
    vim.api.nvim_command('autocmd BufWritePre *.js lua vim.lsp.buf.format(nil, 100)')
    common_on_attach(client, bufnr)
  end,
}

-- ESLINT (JS, TS)
nvim_lsp.eslint.setup {
  on_attach = function(client, bufnr)
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
  end,
  settings = {
    format = { enable = true }, -- this will enable formatting
  },
}
