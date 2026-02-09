return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			-- list of servers for mason to install
			ensure_installed = {
				"clangd",
				-- "ts_ls", -- Using typescript-tools.nvim instead for better TypeScript support
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"eslint",
			},
		},
		config = function(_, opts)
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			
			-- Enhanced capabilities for auto-completion and auto-import
			local capabilities = cmp_nvim_lsp.default_capabilities()
			
			mason_lspconfig.setup(opts)
			
			-- Setup handlers for automatic server configuration
			mason_lspconfig.setup_handlers({
				-- Default handler for all servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				
				-- Lua LSP with Neovim-specific settings
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
							},
						},
					})
				end,
				
				-- Python LSP with auto-import support
				["pyright"] = function()
					lspconfig.pyright.setup({
						capabilities = capabilities,
						settings = {
							python = {
								analysis = {
									autoSearchPaths = true,
									useLibraryCodeForTypes = true,
									diagnosticMode = "workspace",
								},
							},
						},
					})
				end,
				
				-- Emmet LSP for HTML/CSS abbreviations
				["emmet_ls"] = function()
					lspconfig.emmet_ls.setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"css",
							"scss",
							"sass",
							"less",
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
							"vue",
							"svelte",
						},
					})
				end,
			})
		end,
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
			},
		},
		dependencies = {
			"mason-org/mason.nvim",
		},
	},
}
