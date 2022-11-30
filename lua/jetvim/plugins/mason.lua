local status, mason = pcall(require, "mason")
if not status then
  return
end
local ml_status, mason_lsp = pcall(require, "mason-lspconfig")
if not ml_status then
  return
end
mason.setup()
mason_lsp.setup()
