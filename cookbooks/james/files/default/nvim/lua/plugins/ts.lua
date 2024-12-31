return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "css", "python", "rust", "ruby", "typescript", "tablegen", "textproto", "proto", "terraform", "yaml" },
          disable = { "mlir" },
          sync_install = true,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
}
