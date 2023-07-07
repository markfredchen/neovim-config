local status, lspconfig = pcall(require, "lspconfig")
if not status then
  return
end

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  nio.keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
  nio.keymap("n", "gd", vim.lsp.buf.definition, bufopts)
  nio.keymap("n", "K", vim.lsp.buf.hover, bufopts)
  nio.keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
  nio.keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  nio.keymap("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  nio.keymap("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  nio.keymap(
    "n",
    "<Leader>wl",
    function()
      print(vim.inspact(vim.lsp.buf.list_workspace_folders()))
    end,
    bufopts
  )
  nio.keymap("n", '<Leader>D', vim.lsp.buf.type_definition, bufopts)
  nio.keymap("n", '<Leader>rn', vim.lsp.buf.rename, bufopts)
  nio.keymap("n", '<Leader>ca', vim.lsp.buf.code_action, bufopts)
  nio.keymap("n", '<Leader>fc', vim.lsp.buf.format, bufopts)
  nio.keymap("n", 'gr', vim.lsp.buf.references, bufopts)
  nio.keymap("n", '<C-f>', function() vim.lsp.buf.format { async = true } end, bufopts)
end

lspconfig["pyright"].setup({
  on_attach = on_attach,
})

lspconfig["yamlls"].setup({
  settings = {
    yaml = {
      format = {
        enable = true,
      },
      hover = true,
      completion = true,
      customTags = {
        "!Fn",
        "!And",
        "!If",
        "!Not",
        "!Equals",
        "!Or",
        "!FindInMap sequence",
        "!Base64",
        "!Cidr",
        "!Ref",
        "!Ref Scalar",
        "!Sub",
        "!GetAtt",
        "!GetAZs",
        "!ImportValue",
        "!Select",
        "!Split",
        "!Join sequence"
      }
    }
  }
})

vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
