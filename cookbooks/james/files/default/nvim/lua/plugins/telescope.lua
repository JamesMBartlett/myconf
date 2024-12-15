return {
  -- Telescope plugin
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- Telescope setup
      require("telescope").setup({
        defaults = {
          prompt_prefix = "❯ ",
          selection_caret = "❯ ",
          path_display = { "truncate" },
          layout_strategy = "horizontal",
          layout_config = {
            preview_width = 0.6,
            prompt_position = "top",
          },
          sorting_strategy = "ascending",
        },
        pickers = {
          find_files = { hidden = true },
          live_grep = { additional_args = function() return { "--hidden", "--glob", "!.git/*" } end },
          buffers = { sort_lastused = true },
        },
      })

      -- Load the FZF extension
      vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true }) -- Files
      vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true }) -- Search with ripgrep
      vim.api.nvim_set_keymap('n', '<leader>to', '<cmd>Telescope oldfiles<CR>', { noremap = true, silent = true }) -- Recently used files
      vim.api.nvim_set_keymap('n', '<leader>gr', '<cmd>Telescope lsp_references<CR>', { noremap = true, silent = true }) -- References of symbol under cursor.
    end,
  },
}
