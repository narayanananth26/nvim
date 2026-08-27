return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		require("treesitter-context").setup({
			enable = true,
			multiwindow = false,
			max_lines = 0,
			min_window_height = 0,
			line_numbers = true,
			multiline_threshold = 1,
			trim_scope = "outer",
			mode = "cursor",
			separator = nil,
			zindex = 20,
			on_attach = nil,
		})
		vim.keymap.set("n", "[c", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { silent = true })

		vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "TreesitterContextBottom", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { bg = "NONE" })
	end,
}
