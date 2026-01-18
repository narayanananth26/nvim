return {
	{
		"folke/noice.nvim",
		event = "verylazy",
		opts = {
			lsp = {
				hover = {
					enabled = true,
					opts = {
						border = { style = "rounded", padding = { 0, 1 } },
					},
				},
				signature = {
					enabled = true,
					opts = {
						border = { style = "rounded" },
					},
				},
			},
			routes = {
				{
					filter = { event = "msg_show", find = "G" },
					opts = { skip = true },
				},
			},
		},
		dependencies = {
			"muniftanjim/nui.nvim",
			-- "rcarriga/nvim-notify", -- optional
		},
	},
}
