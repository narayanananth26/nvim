return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				hover = {
					enabled = true,
					opts = {
						border = {
							style = "rounded", -- choose "single", "rounded", "double", etc
							padding = { 0, 1 }, -- optional padding inside the border
						},
					},
				},
				signature = {
					enabled = true,
					opts = {
						border = {
							style = "rounded",
						},
					},
				},
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
		},
	},
}
