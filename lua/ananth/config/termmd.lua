vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("TermmdPreview", { clear = true }),
	pattern = "markdown",
	callback = function(args)
		vim.keymap.set("n", "<leader>md", function()
			local file = vim.api.nvim_buf_get_name(args.buf)
			vim.cmd("vsplit")
			vim.cmd("enew")
			local job = vim.fn.jobstart({ "termmd", "--watch", "--images", "blocks", file }, { term = true })
			local preview = vim.api.nvim_get_current_buf()
			-- termmd doesn't take mouse input, so a click or scroll drops nvim out of terminal mode
			vim.keymap.set("n", "<LeftRelease>", "<LeftRelease>i", { buffer = preview, silent = true })
			for wheel, key in pairs({ ["<ScrollWheelDown>"] = "jjj", ["<ScrollWheelUp>"] = "kkk" }) do
				vim.keymap.set({ "n", "t" }, wheel, function()
					vim.fn.chansend(job, key)
				end, { buffer = preview })
			end
			for _, dir in ipairs({ "h", "j", "k", "l" }) do
				vim.keymap.set("t", "<C-" .. dir .. ">", "<C-\\><C-n><C-w>" .. dir, { buffer = preview })
			end
			for _, arrow in ipairs({ "Up", "Down", "Left", "Right" }) do
				local key = "<S-" .. arrow .. ">"
				vim.keymap.set("t", key, "<C-\\><C-n>" .. key .. "i", { buffer = preview, remap = true })
			end
			vim.api.nvim_create_autocmd("BufEnter", {
				buffer = preview,
				command = "startinsert",
			})
			vim.cmd("startinsert")
		end, { buffer = args.buf, desc = "Preview with termmd" })
	end,
})
