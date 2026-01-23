return {
	{
		"arnamak/stay-centered.nvim",
		config = function()
			require("stay-centered").setup({
				skip_filetypes = {"dashboard"},
			})
			
			-- Explicitly disable stay-centered on dashboard
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "dashboard",
				callback = function()
					vim.b.stay_centered_enabled = false
				end,
			})
			
			-- Also disable on BufEnter for dashboard buffers
			vim.api.nvim_create_autocmd("BufEnter", {
				callback = function()
					if vim.bo.filetype == "dashboard" then
						vim.b.stay_centered_enabled = false
					end
				end,
			})
		end,
	},
}