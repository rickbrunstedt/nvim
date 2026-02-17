return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
		"isak102/telescope-git-file-history.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	lazy = false,
	opts = {
		pickers = {
			find_files = {
				hidden = false,
			},
			git_files = {
				hidden = false,
			},
		},
		defaults = {
			file_ignore_patterns = {
				".git/*",
				-- "node_modules/*",
			},
		},
		extensions = {
			fzf = {},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("undo")
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("git_file_history")

		local builtin = require("telescope.builtin")

		local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
		if vim.v.shell_error ~= 0 then
			git_root = vim.fn.getcwd() -- fallback to current dir
		end

		local wk = require("which-key")
		wk.add({
			{ "<leader>f", group = "Find" },
		})

		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ cwd = git_root })
		end, { desc = "Find files" })

		vim.keymap.set("n", "<leader>fF", function()
			builtin.find_files({
				cwd = git_root,
				hidden = true,
			})
		end, { desc = "Find hidden files" })

		vim.keymap.set("n", "<leader>fc", function()
			builtin.git_status()
		end, { desc = "Find git dirty files" })

		vim.keymap.set("n", "<leader><leader>", function()
			builtin.buffers({
				sort_lastused = true,
			})
		end, { desc = "Telescope buffers" })

		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find live grep" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
		vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Find quickfix" })
		vim.keymap.set("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "Search current buffer" })
		vim.keymap.set("n", "<leader>fs", builtin.symbols, { desc = "Find symbols" })
	end,
}
