return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Trouble",
		opts = {
			auto_close = false,
			auto_open = false,
			auto_preview = true,
			auto_refresh = true,
			focus = true,
		},
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle focus=true<cr>",
				desc = "Toggle Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>xs",
				"<cmd>Trouble symbols toggle focus=true<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>xl",
				"<cmd>Trouble lsp toggle focus=true win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
