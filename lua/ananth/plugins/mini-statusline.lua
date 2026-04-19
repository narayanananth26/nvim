return {
	"echasnovski/mini.statusline",
	version = "*",
	config = function()
		local statusline = require("mini.statusline")
		statusline.setup({
			content = {
				active = function()
					local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
					local git = statusline.section_git({ trunc_width = 40 })
					local diff = statusline.section_diff({ trunc_width = 75 })
					local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
					local lsp = statusline.section_lsp({ trunc_width = 75 })
					local filename = statusline.section_filename({ trunc_width = 140 })
					local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
					local location = statusline.section_location({ trunc_width = 75 })
					local search = statusline.section_searchcount({ trunc_width = 75 })

					return statusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
						"%<",
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=",
						"%S",
						{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
						{ hl = mode_hl, strings = { search, location } },
					})
				end,
			},
		})

		local function set_highlights()
			vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { bg = "#eb6f92", fg = "#1f1d2e", bold = true })
			vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { bg = "#c4a7e7", fg = "#1f1d2e", bold = true })
			vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { bg = "#9ccfd8", fg = "#1f1d2e", bold = true })
			vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { bg = "#b83d5a", fg = "#f0e0e0", bold = true })
			vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { bg = "#eb6f92", fg = "#1f1d2e", bold = true })
			vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", { bg = "#eb6f92", fg = "#1f1d2e", bold = true })
		end

		set_highlights()
		vim.api.nvim_create_autocmd("ColorScheme", { callback = set_highlights })
	end,
}
