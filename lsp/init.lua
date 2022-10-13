local nvim_lsp = require('lspconfig')
local navic = require("nvim-navic")

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

function common_on_attach(client, bufnr)
  vim.api.nvim_buf_set_keymap(
    bufnr, 'n', 'gd',
    '<cmd>lua vim.lsp.buf.definition()<CR>',
    { noremap = true, silent = false }
  )
  navic.attach(client, bufnr)
end

-- LUA
nvim_lsp.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_command('autocmd BufWritePre *.lua lua vim.lsp.buf.format(nil, 100)')
    common_on_attach(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

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


-- PYTHON
nvim_lsp.pyright.setup {
  capabilities = capabilities,
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
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_command('autocmd BufWritePre *.tsx lua vim.lsp.buf.format(nil, 100)')
    vim.api.nvim_command('autocmd BufWritePre *.jsx lua vim.lsp.buf.format(nil, 100)')
    vim.api.nvim_command('autocmd BufWritePre *.ts lua vim.lsp.buf.format(nil, 100)')
    vim.api.nvim_command('autocmd BufWritePre *.js lua vim.lsp.buf.format(nil, 100)')
    common_on_attach(client, bufnr)
  end,
}

-- Volar
nvim_lsp.volar.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
  end,
}
