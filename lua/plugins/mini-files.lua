return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup()
		require("mini.surround").setup()
		require("mini.files").setup()

		-- Keymap: press `-` to open MiniFiles at current file
		vim.keymap.set("n", "-", function()
			local buf_path = vim.api.nvim_buf_get_name(0)
			local dir = vim.fn.fnamemodify(buf_path, ":p:h")
			require("mini.files").open(dir)
		end, { desc = "Open file explorer (mini.files)" })
	end,
}
