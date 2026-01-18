return {
	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		keys = {
			{ "<leader>do", ":DiffviewOpen<CR>", desc = "Open Diffview" },
			{ "<leader>dh", ":DiffviewFileHistory<CR>", desc = "File History" },
		},
		config = function()
			require("diffview").setup({
				diff_binaries = false, -- show diffs for binary files
				enhanced_diff_hl = true, -- better highlighting
			})
		end,
	},
}
