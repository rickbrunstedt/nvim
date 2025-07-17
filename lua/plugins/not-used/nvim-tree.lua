return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	keys = {
		{ "<leader>nf", "<cmd>NvimTreeFindFile<cr>", desc = "Find file in filetree" },
		{ "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Find file in filetree" },
	},
	opts = {
		filters = {
			custom = { ".git", "node_modules", ".vscode" },
			dotfiles = true,
		},
		git = {},
		view = {
			adaptive_size = true,
			float = {
				enable = true,
			},
		},
	},
}

-- return {
-- 	"nvim-tree/nvim-tree.lua",
-- 	dependencies = {
-- 		"nvim-tree/nvim-web-devicons",
-- 	},
-- 	lazy = false,
-- 	opts = {
-- 		filters = {
-- 			custom = { ".git", "node_modules", ".vscode" },
-- 			dotfiles = true,
-- 		},
-- 		git = {},
-- 		view = {
-- 			adaptive_size = true,
-- 			float = {
-- 				enable = false,
-- 			},
-- 		},
-- 	},
-- 	config = function(_, opts)
-- 		local tree = require("nvim-tree")
-- 		local api = require("nvim-tree.api")
--
-- 		tree.setup(opts)
-- 		local float_opts = vim.deepcopy(opts)
-- 		float_opts.view.float.enable = true
--
-- 		vim.keymap.set("n", "<C-n>", function()
-- 			if api.tree.is_visible() then
-- 				api.tree.close()
-- 			else
-- 				tree.setup(opts)
-- 				api.tree.toggle()
-- 			end
-- 		end, { desc = "Find file in filetree" })
--
-- 		vim.keymap.set("n", "\\", function()
-- 			api.tree.open()
-- 			tree.setup(float_opts)
-- 			api.tree.open()
-- 		end, { desc = "Find file in filetree" })
--
-- 		vim.keymap.set("n", "<C-m>", function()
-- 			tree.setup(float_opts)
-- 			api.tree.open()
-- 		end, { desc = "Open NvimTree (float)" })
-- 	end,
-- 	keys = {
-- 		-- { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Find file in filetree" },
-- 	},
-- }
