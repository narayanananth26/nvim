return {
	{
		"rbong/vim-flog",
		dependencies = { "tpope/vim-fugitive" },
		cmd = { "Flog", "Flogsplit", "Floggit" },
		keys = {
			{ "<leader>gl", "<cmd>Flog<CR>", desc = "Git log graph" },
			{ "<leader>gL", "<cmd>Flogsplit<CR>", desc = "Git log split" },
		},
	},
}
