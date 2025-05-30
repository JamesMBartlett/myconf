return {
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()

    local servers = { "pyright", "clangd", "bzl", "gopls" }

		local on_attach = function(_, bufnr)
		  local function buf_set_keymap(...)
		    vim.api.nvim_buf_set_keymap(bufnr, ...)
		  end
		
		  -- Key mapping for Go to Definition
		  buf_set_keymap('n', '<leader>gt', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
      buf_set_keymap('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true }) -- Rename symbol
      buf_set_keymap('n', '<leader>ra', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true }) -- Code actions (includes refactor)
		end

    for _, server in ipairs(servers) do
      if server == "clangd" then
        require("lspconfig")[server].setup({
          on_attach = on_attach,
          filetypes = {"c", "cpp", "objc", "objcpp", "cuda"} -- exclude proto.
        })
      elseif server == "gopls" then
        require("lspconfig")[server].setup({
          on_attach = on_attach,
          settings = {
            gopls = {
              directoryFilters = {
                "-bazel-bin",
                "-bazel-out",
                "-bazel-gimlet",
                "-bazel-testlogs",
                "-external",
                "-**/node_modules",
                "-**/storybook-static",
                "-**/.next",
                "-**/__pycache__"
              },
            },
          },
        })
      else
        require("lspconfig")[server].setup({
          on_attach = on_attach,
        })
      end
    end
  end,
}
