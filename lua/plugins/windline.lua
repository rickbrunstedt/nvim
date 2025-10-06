return {
	"windwp/windline.nvim",
	config = function()
		-- local windline = require("windline")
		-- local helper = require("windline.helpers")
		--
		-- local components = {
		-- 	file_path = {
		-- 		text = function()
		-- 			return vim.fn.expand("%:p") -- full absolute path
		-- 		end,
		-- 		hl_colors = { "cyan", "black" },
		-- 	},
		-- }
		--
		-- windline.setup({
		-- 	statuslines = {
		-- 		default = {
		-- 			active = {
		-- 				{ components.file_path }, -- add your path component here
		-- 			},
		-- 		},
		-- 	},
		-- })

		require("wlsample.bubble")
	end,
}

-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		require("lualine").setup({
-- 			-- theme = "bubble",
-- 			sections = {
-- 				lualine_c = {
-- 					{
-- 						"filename",
-- 						path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path, 3 = absolute path with `~`
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- }
