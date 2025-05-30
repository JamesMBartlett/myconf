return {
  "yetone/avante.nvim",
  lazy = false,
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  opts = {
    provider = "claude",
    cursor_applying_provider = "groq",
    behaviour = {
      enable_cursor_planning_mode = true,
    },
    claude = {
      api_key_name = "cmd:op item get --vault Auger Anthropic --fields label=credential --reveal",
      disable_tools = true,
    },
    vendors = {
      groq = {
        __inherited_from = 'openai',
        api_key_name = "cmd:op item get --vault Auger Groq --fields label=credential --reveal",
        endpoint = 'https://api.groq.com/openai/v1/',
        model = 'llama-3.3-70b-versatile',
        max_tokens = 32768,
      },
    },
    file_selector = {
      provider = "telescope",
      provider_opts = {
        get_filepaths = function(params)
          local cwd = params.cwd
          local selected_filepaths = params.selected_filepaths
          local cmd = string.format("fd --base-directory '%s' -H -E .git --type f", vim.fn.fnameescape(cwd))
          local output = vim.fn.system(cmd)
          local filepaths = vim.split(output, "\n", { trimempty = true })
          return vim
            .iter(filepaths)
            :filter(function(filepath)
              return not vim.tbl_contains(selected_filepaths, filepath)
            end)
            :totable()
        end,
      },
    },
    disabled_tools = { "python" },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
        latex = false,
      },
      ft = { "markdown", "Avante" },
    },
  },
}
