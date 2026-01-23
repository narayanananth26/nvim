return {
	{
		"folke/noice.nvim",
		event = "verylazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
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
				-- Don't let noice handle diagnostics messages
				progress = {
					enabled = true,
					format = "lsp_progress",
					format_done = "lsp_progress_done",
				},
				message = {
					enabled = true,
				},
			},
			routes = {
				{
					filter = { event = "msg_show", find = "G" },
					opts = { skip = true },
				},
			},
			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
		},
		dependencies = {
			"muniftanjim/nui.nvim",
			-- "rcarriga/nvim-notify", -- optional
		},
	},
}
