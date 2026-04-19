return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "fugitive",
				callback = function()
					vim.keymap.set("n", "gpf", ":Git push --force<CR>", { desc = "Fugitive git push force" })
				end,
			})
		end,
	},
}
