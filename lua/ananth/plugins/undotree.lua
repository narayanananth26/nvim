return {
	{
		"mbbill/undotree",
		config = function()
			-- Toggle undotree
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
			
			-- Focus undotree window when opened
			vim.g.undotree_SetFocusWhenToggle = 1
			
			-- Use shorter timestamps
			vim.g.undotree_ShortIndicators = 1
			
			-- Set window width
			vim.g.undotree_SplitWidth = 35
		end,
	},
}
