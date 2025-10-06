return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("lspconfig")

		vim.diagnostic.config({
			virtual_text = true,
			severity_sort = true,
			float = { border = "rounded" },
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function()
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = 0, desc = desc })
				end

				-- Unset 'formatexpr'
				-- vim.bo[args.buf].formatexpr = nil
				-- Unset 'omnifunc'
				-- vim.bo[args.buf].omnifunc = nil

				map("n", "K", vim.lsp.buf.hover, "Hover")
				map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
				map({ "n", "x" }, "<leader>cf", function()
					vim.lsp.buf.format({ async = true })
				end, "Format")
				map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code actions")
				map("n", "<leader>vd", vim.diagnostic.open_float, "View diagnostics")
			end,
		})

		local capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			require("cmp_nvim_lsp").default_capabilities()
		)

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					hint = { enable = true },
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {
							"vim",
							"require",
						},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						-- checkThirdParty = false
					},
				},
			},
		})

		-- vim.lsp.config("gopls", {
		-- 	capabilities = capabilities,
		-- 	settings = { gopls = { analyses = { useany = false } } },
		-- })

		vim.lsp.config("vtsls", {
			capabilities = capabilities,
			init_options = { hostInfo = "neovim" },
		})

		vim.lsp.enable("lua_ls")
		vim.lsp.enable("gopls")
		vim.lsp.enable("vtsls")
		-- vim.lsp.enable("biome")

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"vtsls",
				"gopls",
				"zls",
				-- "lua-language-server",
				-- "stylua",
				-- "biome",
			},
		})
	end,
}
