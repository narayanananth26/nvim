return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup()

		-- Hunk staging
		vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
		vim.keymap.set("v", "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Stage selected lines" })
		vim.keymap.set("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage hunk" })
		vim.keymap.set("n", "<leader>hS", ":Gitsigns stage_buffer<CR>", { desc = "Stage entire buffer" })
		vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
		vim.keymap.set("v", "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Reset selected lines" })
		vim.keymap.set("n", "<leader>hR", ":Gitsigns reset_buffer<CR>", { desc = "Reset entire buffer" })

		-- Hunk navigation
		vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", { desc = "Next hunk" })
		vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", { desc = "Previous hunk" })

		-- Hunk preview and blame
		vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
		vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle line blame" })
		vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Blame line" })

		-- Diff view
		vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Diff this file" })
	end,
}
