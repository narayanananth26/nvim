return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")

			wk.setup({
				preset = "modern",
				delay = 500, -- delay before showing the popup (ms)
			})

			-- Add group labels for better organization
			wk.add({
				{ "<leader>f", group = "Find (Telescope)" },
				{ "<leader>g", group = "Git" },
				{ "<leader>l", group = "LSP/Lazy" },
				{ "<leader>d", group = "Diff/Debug" },
			})
		end,
	},
}
