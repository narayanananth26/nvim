return {
	{
		"rbong/vim-flog",
		dependencies = { "tpope/vim-fugitive" },
		cmd = { "Flog", "Flogsplit", "Floggit" },
		keys = {
			{ "<leader>ll", "<cmd>Flog<CR>", desc = "Git log graph" },
		},
	},
}
