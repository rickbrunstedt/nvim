local formatter_table = {
	"prettierd",
	"biome",
	stop_after_first = true,
}

return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			biome = {
				require_cwd = false,
			},
			-- prettier = {
			-- 	require_cwd = true,
			-- },
			prettierd = {
				require_cwd = true,
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = formatter_table,
			javascriptreact = formatter_table,
			typescript = formatter_table,
			typescriptreact = formatter_table,
			jsonc = formatter_table,
			json = formatter_table,
			yaml = formatter_table,
			markdown = formatter_table,
			html = formatter_table,
		},
		format_on_save = {
			timeout_ms = 500,
			-- lsp_format = "fallback",
		},
	},
}
