return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "html",
      "css",
      "python",
      "rust",
      "ruby",
      "typescript",
      "tablegen",
      "textproto",
      "proto",
      "terraform",
      "yaml",
    })
  end,
}
