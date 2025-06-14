return {
  "stevearc/conform.nvim",
  dependencies = { "zapling/mason-conform.nvim" },
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        bzl = { "buildifier" },
        python = { "autoflake", "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        cuda = { "clang-format" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        proto = { "clang-format" },
        go = {"gofumpt", "goimports", "gci"},
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      formatters = {
        autoflake = {
          prepend_args = { "--remove-all-unused-imports" },
        },
        buildifier = {
          prepend_args = { "--lint=fix" },
        },
        shfmt = {
          prepend_args = { "-i", "2" },
        },
        gci = {
          prepend_args = { "-s", "standard", "-s", "default", "-s", "prefix(gimletlabs.ai/gimlet)" },
        },
      },
    })
    require("mason-conform").setup()
  end,
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
