
-- Terminal toggle functionality
local terminal_buf = nil
local terminal_win = nil

local function toggle_terminal()
  -- Check if terminal window exists and is valid
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    -- Close the terminal window
    vim.api.nvim_win_close(terminal_win, false)
    terminal_win = nil
    return
  end

  -- Create or reuse terminal buffer
  if not terminal_buf or not vim.api.nvim_buf_is_valid(terminal_buf) then
    terminal_buf = vim.api.nvim_create_buf(false, true)
  end

  -- Calculate window dimensions (80% of screen)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create floating window
  terminal_win = vim.api.nvim_open_win(terminal_buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = " Terminal ",
    title_pos = "center",
  })

  -- Start terminal if buffer is empty
  if vim.api.nvim_buf_line_count(terminal_buf) == 1 and vim.api.nvim_buf_get_lines(terminal_buf, 0, 1, false)[1] == "" then
    vim.cmd("terminal")
  end

  -- Enter insert mode in terminal
  vim.cmd("startinsert")
end

-- Bind Ctrl+/ (which appears as Ctrl+_) to toggle terminal
vim.keymap.set({"n", "t"}, "<C-_>", toggle_terminal, { desc = "Toggle terminal", silent = true })
vim.keymap.set({"n", "t"}, "<C-/>", toggle_terminal, { desc = "Toggle terminal", silent = true })
vim.keymap.set({"t"}, "<esc><esc>", toggle_terminal, { desc = "Toggle terminal", silent = true })


-- Old setup
-- local set = vim.opt_local
--
-- -- Set local settings for terminal buffers
-- vim.api.nvim_create_autocmd("TermOpen", {
-- 	group = vim.api.nvim_create_augroup("custom-term-open", {}),
-- 	callback = function()
-- 		set.number = false
-- 		set.relativenumber = false
-- 		set.scrolloff = 0
--
-- 		vim.bo.filetype = "terminal"
-- 	end,
-- })
--
-- -- Easily hit escape in terminal mode.
-- vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- open a terminal at the bottom of the screen with a fixed height.
-- vim.keymap.set("n", ",st", function()
-- 	vim.cmd.new()
-- 	vim.cmd.wincmd("j")
-- 	vim.api.nvim_win_set_height(0, 12)
-- 	vim.wo.winfixheight = true
-- 	vim.cmd.term()
-- end, { desc = "Open Terminal" })

-- vim.keymap.set("n", "t", function()
-- 	vim.cmd.new()
-- 	vim.cmd.wincmd("j")
-- 	vim.api.nvim_win_set_height(0, 12)
-- 	vim.wo.winfixheight = true
-- 	vim.cmd.term()
-- end, { desc = "Open Terminal" })
