return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "rustywind", "prettier" },
			javascriptreact = { "rustywind", "prettier" },
			typescript = { "rustywind", "prettier" },
			typescriptreact = { "rustywind", "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			html = { "rustywind", "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			svelte = { "rustywind", "prettier" },
		},
		formatters = {
			["clang-format"] = {
				-- Respect a project .clang-format; otherwise use LLVM with 4-space indents
				prepend_args = function(_, ctx)
					local found = vim.fs.find({ ".clang-format", "_clang-format" }, { upward = true, path = ctx.dirname })
					if #found > 0 then
						return {}
					end
					return { "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4}" }
				end,
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
