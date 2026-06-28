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
			win = { size = 50 },
			modes = {
				lsp = {
					win = { size = 20, position = "bottom" },
				},
				lsp_references = {
					win = { size = 15, position = "bottom" },
				},
				symbols = {
					win = { size = 20, position = "bottom" },
				},
				diagnostics = {
					win = { size = 20, position = "bottom" },
				},
				qflist = {
					win = { size = 20, position = "bottom" },
				},
			},
		},
		keys = {
			{
				"<leader>d",
				"<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
				desc = "Toggle Diagnostics (Trouble)",
			},
			{
				"<leader>s",
				"<cmd>Trouble symbols toggle focus=true<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>xl",
				"<cmd>Trouble lsp toggle focus=true<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>qf",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
			{
				"]c",
				"<cmd>Trouble qflist next jump=true<cr>",
				desc = "Quickfix next (Trouble)",
			},
			{
				"[c",
				"<cmd>Trouble qflist prev jump=true<cr>",
				desc = "Quickfix prev (Trouble)",
			},
		},
	},
}
