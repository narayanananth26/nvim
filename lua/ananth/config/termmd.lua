vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("TermmdPreview", { clear = true }),
	pattern = "markdown",
	callback = function(args)
		vim.keymap.set("n", "<leader>md", function()
			local file = vim.api.nvim_buf_get_name(args.buf)
			vim.cmd("vsplit")
			vim.cmd("enew")
			vim.fn.jobstart({ "termmd", "--watch", "--images", "blocks", file }, { term = true })
			vim.cmd("startinsert")
		end, { buffer = args.buf, desc = "Preview with termmd" })
	end,
})
