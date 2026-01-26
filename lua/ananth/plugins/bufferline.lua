return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					numbers = "none",
					close_command = "bdelete! %d",
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							highlight = "Directory",
							text_align = "left",
							separator = true,
						},
					},
					separator_style = "thin",
					show_buffer_close_icons = false,
					show_close_icon = false,
					always_show_bufferline = true,
					hover = {
						enabled = true,
						delay = 200,
						reveal = { "close" },
					},
				},
			})
		end,
	},
}
