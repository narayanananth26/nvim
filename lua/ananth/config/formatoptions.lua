vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("NoCommentContinuation", { clear = true }),
	callback = function()
		vim.opt_local.formatoptions:remove("r")
		vim.opt_local.formatoptions:remove("o")
	end,
})
