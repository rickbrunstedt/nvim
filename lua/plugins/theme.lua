local tokyonight = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
		})
		vim.cmd([[colorscheme tokyonight]])
	end,
}

local catppuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- Load early
	lazy = false, -- Load immediately (important for colorscheme)
	config = function()
		require("catppuccin").setup({
			flavour = "frappe", -- latte, frappe, macchiato, mocha
			background = {
				light = "latte",
				dark = "frappe",
			},
			-- transparent_background = false,
			-- show_end_of_buffer = false,
			-- term_colors = false,
			-- dim_inactive = {
			--   enabled = false,
			--   shade = 'dark',
			--   percentage = 0.15,
			-- },
			-- no_italic = false,
			-- no_bold = false,
			-- no_underline = false,
			-- styles = {
			--   comments = { 'italic' },
			--   conditionals = { 'italic' },
			-- },
			-- integrations = {
			--   cmp = true,
			--   gitsigns = true,
			--   nvimtree = true,
			--   treesitter = true,
			--   mini = {
			--     enabled = true,
			--   },
			-- },
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}

return {
	-- catppuccin,

	-- {"catppuccin/nvim", name = "catppuccin"}
	-- tokyonight,
}
