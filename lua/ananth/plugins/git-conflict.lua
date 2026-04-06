return {
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = function()
			require("git-conflict").setup()

			vim.api.nvim_set_hl(0, "GitConflictCurrent", { bg = "#1a1f2e" })
			vim.api.nvim_set_hl(0, "GitConflictCurrentLabel", { bg = "#1e2a3a", fg = "#7dcfff", bold = true })
			vim.api.nvim_set_hl(0, "GitConflictIncoming", { bg = "#1a2118" })
			vim.api.nvim_set_hl(0, "GitConflictIncomingLabel", { bg = "#1e2a1e", fg = "#9ece6a", bold = true })
			vim.api.nvim_set_hl(0, "GitConflictAncestor", { bg = "#1f1c10" })
			vim.api.nvim_set_hl(0, "GitConflictAncestorLabel", { bg = "#2a2510", fg = "#e0af68" })
		end,
	},
}
