return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			vim.diagnostic.config({
				-- virtual_lines = true,
				virtual_text = true,
			})

			local lspconfig_defaults = require("lspconfig").util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				"force",
				lspconfig_defaults.capabilities,
				require("cmp_nvim_lsp").default_capabilities()
			)

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
							path = vim.split(package.path, ";"),
						},
						diagnostics = {
							globals = { "vim" }, -- suppress 'vim' undefined
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
						hint = { enable = true },
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local builtin = require("telescope.builtin")

					vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
					vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0, desc = "Go to definition" })
					vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0, desc = "Go to definition" })
					vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
					-- HERE: shift-k
					-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

					local wk = require("which-key")
					wk.add({
						{ "<leader>w", proxy = "<c-w>", group = "Windows" }, -- proxy to window mappings
						{ "<leader>c", group = "Code" },
					})
					vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = 0, desc = "Rename" })
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0, desc = "Code actions" })
					vim.keymap.set(
						{ "n", "x" },
						"<leader>cf",
						"<cmd>lua vim.lsp.buf.format({async = true})<cr>",
						{ buffer = 0, desc = "Code format" }
					)
					vim.keymap.set(
						"n",
						"<leader>cd",
						builtin.lsp_document_symbols,
						{ buffer = 0, desc = "Document symbols" }
					)

					local opts = { buffer = event.buf }
					-- HERE: shift-k
					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					-- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					-- vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					-- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					-- vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					-- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					-- vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

					vim.keymap.set(
						"n",
						"<leader>vd",
						"<cmd>lua vim.diagnostic.open_float()<cr>",
						{ desc = "View Diagnostics" }
					)
					vim.keymap.set(
						"n",
						"<leader>pd",
						"<cmd>Telescope diagnostics<cr>",
						{ desc = "Projects Diagnostics" }
					)
					vim.keymap.set(
						"n",
						"<leader>pb",
						"<cmd>Telescope diagnostics bufnr=0<cr>",
						{ desc = "Buffer Diagnostics" }
					)
					-- vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					-- vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
					-- vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				end,
			})

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- "astro",
					"cssls",
					"vtsls",
					"cssmodules_ls",
					"gopls",
					"lua_ls",
				},
				handlers = {
					function(server_name) -- default handler (optional)
						require("lspconfig")[server_name].setup({})
					end,
					["vtsls"] = function()
						require("lspconfig").vtsls.setup({
							root_dir = require("lspconfig").util.root_pattern(
								".git",
								"pnpm-workspace.yaml",
								"pnpm-lock.yaml",
								"yarn.lock",
								"package-lock.json",
								"bun.lockb"
							),
							typescript = {
								tsserver = {
									maxTsServerMemory = 12288,
								},
							},
							experimental = {
								completion = {
									entriesLimit = 3,
								},
							},
						})
					end,
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Insert }
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<Tab>"] = cmp.mapping.select_next_item({ behaviour = cmp.SelectBehavior.Insert }),
					["<S-Tab>"] = cmp.mapping.select_prev_item({ behaviour = cmp.SelectBehavior.Insert }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
			})
		end,
	},
}
