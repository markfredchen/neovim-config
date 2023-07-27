return {
  "neovim/nvim-lspconfig",
  config = function()
    local lsp_on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangFormattingProvider = false
    end
    local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
    lsp_capabilities.textDocument.completion.completionItem = {
      documentationFormat = { "markdown", "plaintext" },
      snippetSupport = true,
      preselectSupport = true,
      insertReplaceSupport = true,
      labelDetailsSupport = true,
      deprecatedSupport = true,
      commitCharactersSupport = true,
      tagSupport = { valueSet = { 1 } },
      resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        }
      }
    }
    require("lspconfig").lua_ls.setup({
      on_attach = lsp_on_attach,
      capabilities = lsp_capabilities, 
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          }
        }
      }
    })
  end,
}
