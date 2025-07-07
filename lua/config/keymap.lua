local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Next errors i think..
vim.keymap.set("n", "<]-d>", ":cnext<CR>", opts)
vim.keymap.set("n", "<[-d>", ":cprevious<CR>", opts)
-- vim.keymap.set("n", "<C-j>", ":cnext<CR>", opts)
-- vim.keymap.set("n", "<C-k>", ":cprevious<CR>", opts)

vim.keymap.set("n", "<leader>R", function()
  vim.ui.input({ prompt = "Command: " }, function(command)
    local dir = vim.fn.expand("%:p:h")
    if command then -- check for nil in case user cancels
      vim.cmd(string.format("!cd %s && %s", dir, command))
    end
  end)
end, opts)
vim.keymap.set("v", "<leader>R", function()
  vim.ui.input({ prompt = "Command: " }, function(command)
    local dir = vim.fn.expand("%:p:h")
    if command then -- check for nil in case user cancels
      vim.cmd(string.format("!cd %s && %s", dir, command))
    end
  end)
end, opts)
