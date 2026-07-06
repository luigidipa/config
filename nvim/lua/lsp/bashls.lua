local common = require("lsp.common")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" },
  on_attach = common.on_attach,
  capabilities = capabilities,
  settings = {
    bashIde = {
      shellcheckPath = "shellcheck",
    },
  },
}
