return {
	"artemave/workspace-diagnostics.nvim",
	config = function()
		-- require("lazy").setup({ "artemave/workspace-diagnostics.nvim" })

		-- require("lspconfig").tsserver.setup({
		-- 	on_attach = function(client, bufnr)
		-- 		require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
		-- 	end,
		-- })

		vim.api.nvim_set_keymap("n", "<leader>pD", "", {
			noremap = true,
			desc = "Check full project diagnostics",
			callback = function()
				for _, client in ipairs(vim.lsp.get_clients()) do
					require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
				end
			end,
		})
	end,
}
