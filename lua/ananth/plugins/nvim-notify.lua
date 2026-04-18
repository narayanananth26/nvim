return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		local notify = require("notify")
		notify.setup({
			max_width = 40,
			max_height = 4,
			render = "minimal",
			top_down = false,
			level = vim.log.levels.INFO,
			background_colour = "#000000",
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { border = "none" })
			end,
		})
		vim.notify = notify
	end,
}
