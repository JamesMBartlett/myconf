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

-- Autocmd to quit Vim if NERDTree is the only remaining buffer
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.winnr('$') == 1 and vim.b.NERDTree and vim.b.NERDTree.isTabTree then
      vim.cmd("quit")
    end
  end
})

return { "preservim/nerdtree" }
