return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  config = function ()
    local configs = require("mason-lspconfig.configs")

    configs.setup({
      automatic_installation = true,
    })
  end
}
