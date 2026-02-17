-- General
require("config.set")
require("config.keymap")
require("config.terminal")
-- Plugins
-- require("plugins.mini")

-- override vscode settings
-- local opts = { noremap = true, silent = true }
-- local keymap = vim.keymap.set
-- local vscodeNotify = vim.fn.VSCodeNotify
-- local vscode = require('vscode')

-- VSCode Neovim directional navigation across editor, Explorer, terminal, etc.
if vim.g.vscode then
  local map = vim.keymap.set
  local notify = vim.fn.VSCodeNotify
  local opts = { noremap = false, silent = false }

  -- Global directional focus between panes
  map({ "n", "x" }, "<C-h>", function() notify("workbench.action.navigateLeft") end, opts)
  map({ "n", "x" }, "<C-j>", function() notify("workbench.action.navigateDown") end, opts)
  map({ "n", "x" }, "<C-k>", function() notify("workbench.action.navigateUp") end, opts)
  map({ "n", "x" }, "<C-l>", function() notify("workbench.action.navigateRight") end, opts)

  -- Optional: focus/toggle file explorer with <leader>e
  -- map("n", "<leader>e", function() notify("workbench.view.explorer") end, opts)
  -- map("n", "<CR>", function() notify("list.select") end, opts)
end
