local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.configs.lsp.configs"
require("user.configs.lsp.handlers").setup()
require "user.configs.lsp.null-ls"
