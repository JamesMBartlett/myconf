return {
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' }, -- Make sure `fzf` binary is installed
    config = function()
      -- Key mappings
      --vim.api.nvim_set_keymap('n', '<leader>tt', ':Files<CR>', { noremap = true, silent = true })
      --vim.api.nvim_set_keymap('n', '<leader>tf', ':FzfRG<CR>', { noremap = true, silent = true })
      --vim.api.nvim_set_keymap('n', '<leader>to', ':FzfMru<CR>', { noremap = true, silent = true })

      -- Define the RipgrepFzf function
      local function ripgrep_fzf(query, fullscreen)
        local rg_prefix = 'rg --column --line-number --max-filesize 10M --no-heading --color=always --smart-case --hidden --glob "!.git"'
        local command_fmt = rg_prefix .. " %s -- '%s' | head -n200 || true"
        local initial_command = string.format(command_fmt, '', vim.fn.shellescape(query))
        local reload_command = rg_prefix .. ' $(echo {q} | cut -d: -f1 -s) -- "$(echo {q} | cut -d: -f2-)" | head -n200 || true'
        local spec = { options = { '--phony', '--query', query, '--bind', 'change:reload:' .. reload_command } }
        vim.fn['fzf#vim#grep'](initial_command, 1, vim.fn['fzf#vim#with_preview'](spec), fullscreen)
      end

      -- Create commands for RipgrepFzf
      vim.api.nvim_create_user_command('FzfRG', function(args)
        ripgrep_fzf(args.args, args.bang == '!')
      end, { nargs = '*', bang = true })

      -- MRU Fzf
      vim.api.nvim_create_user_command('FzfMru', function()
        vim.fn['fzf#run'](vim.fn['fzf#wrap']({ source = vim.fn['MruGetFiles']() }))
      end, {})

    end,
  },
}
