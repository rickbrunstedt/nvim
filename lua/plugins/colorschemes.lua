return {
	-- "rktjmp/lush.nvim",
	-- "tckmn/hotdog.vim",
	-- "dundargoc/fakedonalds.nvim",
	-- "craftzdog/solarized-osaka.nvim",
	-- { "rose-pine/neovim", name = "rose-pine" },
	-- "eldritch-theme/eldritch.nvim",
	-- "jesseleite/nvim-noirbuddy",
	-- "miikanissi/modus-themes.nvim",
	-- "rebelot/kanagawa.nvim",
	-- "gremble0/yellowbeans.nvim",
	-- "rockyzhang24/arctic.nvim",
	-- "RRethy/base16-nvim",
	-- "xero/miasma.nvim",
	-- "cocopon/iceberg.vim",
	-- "ntk148v/komau.vim",
	-- "uloco/bluloco.nvim",
	-- "LuRsT/austere.vim",
	-- "NTBBloodbath/sweetie.nvim",
	-- "vim-scripts/MountainDew.vim",
	-- { "maxmx03/fluoromachine.nvim" },

	{
		"Shatur/neovim-ayu",
		-- lazy = false,
		-- priority = 1001,
		-- name = "ayu-mirage",
		config = function()
			-- vim.cmd.colorscheme = "ayu"
			-- vim.cmd([[colorscheme ayu-mirage]])
		end,
	},
	{
		"kepano/flexoki-neovim",
		-- lazy = false,
		-- config = function()
		-- 	require("flexoki").setup()
		-- 	vim.cmd([[colorscheme flexoki]])
		-- end,
	},
	{
		"ricardoraposo/gruvbox-minor.nvim",
		-- lazy = false,
		-- config = function()
		-- 	require("gruvbox-minor").setup()
		-- 	vim.cmd([[colorscheme gruvbox-minor]])
		-- end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- lazy = false,
		-- config = function()
		-- 	require("catppuccin").setup()
		-- 	vim.cmd([[colorscheme catppuccin]])
		-- end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1001,
		config = function()
			require("tokyonight").setup({
				style = "moon",
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
