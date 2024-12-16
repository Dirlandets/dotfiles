local nvim_lsp = require('lspconfig')
local navic = require("nvim-navic")

local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local bufopts = { noremap = true, silent = false }
    -- Go to definition
    vim.api.nvim_set_keymap(
      'n', 'gd',
      '<cmd>lua vim.lsp.buf.definition()<CR>',
      bufopts
    )
    vim.api.nvim_set_keymap(
      'n', 'gf',
      '<cmd>lua vim.lsp.buf.declaration()<CR>',
      bufopts
    )
    vim.keymap.set('n', '<space>df', function() vim.lsp.buf.format { async = true } end, bufopts)
  end
})

-- LUA
nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_command('autocmd BufWritePre *.lua lua vim.lsp.buf.format(nil, 100)')
    navic.attach(client, bufnr)
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
    navic.attach(client, bufnr)
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
  -- capabilities = capabilities,
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
  pyton = {
    analysis = {
      autoSearchPaths = false,
      diagnosticMode = "workspace",
      useLibraryCodeForTypes = true
    }
  }
}

-- Arduino
nvim_lsp.arduino_language_server.setup {
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end
}

-- TS
nvim_lsp.ts_ls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
  settings = {
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
}

-- Terraform
nvim_lsp.tflint.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
}

-- Volar
nvim_lsp.vls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
}

-- ESLINT (JS, TS)
nvim_lsp.eslint.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.resolved_capabilities = {
      document_formating = true,
    }
    vim.api.nvim_command('augroup Format')
    vim.api.nvim_command('autocmd! * <buffer>')
    vim.api.nvim_command('autocmd BufWritePre <buffer> lua vim.lsp.buf.format(nil, 200)')
    vim.api.nvim_command('augroup END')
  end,
  settings = {
    format = { enable = true }, -- this will enable formatting
  },
}
