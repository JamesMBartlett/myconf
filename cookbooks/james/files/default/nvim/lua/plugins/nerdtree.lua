local map = vim.keymap.set

local NerdTreeToggleWithCtx = function()
  if vim.fn.expand('%'):find('NERD_tree_') ~= nil
  then
    vim.cmd("NERDTreeToggle")
  else
    vim.cmd("NERDTreeFind")
  end
end

map('n', "<leader>n", NerdTreeToggleWithCtx)
return { "preservim/nerdtree" }
