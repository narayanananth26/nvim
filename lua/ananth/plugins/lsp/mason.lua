return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"prismals",
				"pyright",
				"eslint",
				"jsonls",
			},
		},
		config = function(_, opts)
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Set capabilities for all servers
			vim.lsp.config("*", { capabilities = capabilities })

			-- Lua LSP with Neovim-specific settings
			vim.lsp.config("lua_ls", {
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

			-- Python LSP with auto-import support
			vim.lsp.config("pyright", {
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

			-- Installed via `npm install -g @typescript/native-preview`, not Mason
			vim.lsp.config("tsgo", {
				settings = {
					typescript = {
						inlayHints = {
							parameterNames = {
								enabled = "all",
								suppressWhenArgumentMatchesName = true,
							},
							parameterTypes = { enabled = true },
							variableTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							enumMemberValues = { enabled = true },
						},
					},
				},
			})
			vim.lsp.enable("tsgo")

			-- sourcekit-lsp is bundled with Xcode and cannot be installed via Mason
			-- Restrict to Swift only; otherwise it claims C/C++/objc and races with clangd
			vim.lsp.config("sourcekit", { filetypes = { "swift" } })
			vim.lsp.enable("sourcekit")

			-- Anchor clangd to project markers only
			vim.lsp.config("clangd", {
				root_markers = { ".clangd", "compile_commands.json", "compile_flags.txt" },
			})

			-- JSON LSP with SchemaStore catalog (Chrome manifest, package.json, etc.)
			vim.lsp.config("jsonls", {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})

			mason_lspconfig.setup(opts)
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
			"b0o/schemastore.nvim",
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
