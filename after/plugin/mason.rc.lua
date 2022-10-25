local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({})

lspconfig.setup {
  ensure_installed = {},
}

local on_attach = function(client, _)
  client.server_capabilities.documentFormattingProvider = false
end

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require 'lspconfig'.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require 'lspconfig'.cssmodules_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require 'lspconfig'.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 100
        }
      }
    }
  }
}

require 'lspconfig'.graphql.setup {
  on_attach = on_attach,
}
