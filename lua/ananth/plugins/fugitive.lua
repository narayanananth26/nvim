return {
	{
		"tpope/vim-fugitive",
		config = function()
			-- Fugitive-specific keymaps
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "fugitive",
				callback = function()
					vim.keymap.set("n", "P", ":!git push<CR>", { buffer = true, desc = "Git push" })
				end,
			})
		end,
	},
}
