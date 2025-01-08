return {
  -- Telescope plugin
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
      }
    },
    config = function()
      local telescope = require("telescope")
      -- Telescope setup
      telescope.setup({
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

      telescope.load_extension("live_grep_args")

      -- Load the FZF extension
      vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true }) -- Files
      vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', { noremap = true, silent = true }) -- Search with ripgrep
      vim.api.nvim_set_keymap('n', '<leader>to', '<cmd>Telescope oldfiles<CR>', { noremap = true, silent = true }) -- Recently used files
      vim.api.nvim_set_keymap('n', '<leader>ts', '<cmd>Telescope lsp_workspace_symbols<CR>', { noremap = true, silent = true }) -- Recently used files
      vim.api.nvim_set_keymap('n', '<leader>gr', '<cmd>Telescope lsp_references<CR>', { noremap = true, silent = true }) -- References of symbol under cursor.
    end,
  },
}
