return {
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = function()
			require("git-conflict").setup()

			vim.api.nvim_set_hl(0, "GitConflictCurrent", { bg = "#1a1f2e" })
			vim.api.nvim_set_hl(0, "GitConflictCurrentLabel", { bg = "#1e2a3a", fg = "#7dcfff", bold = true })
			vim.api.nvim_set_hl(0, "GitConflictIncoming", { bg = "#1a2118" })
			vim.api.nvim_set_hl(0, "GitConflictIncomingLabel", { bg = "#1e2a1e", fg = "#9ece6a", bold = true })
			vim.api.nvim_set_hl(0, "GitConflictAncestor", { bg = "#1f1c10" })
			vim.api.nvim_set_hl(0, "GitConflictAncestorLabel", { bg = "#2a2510", fg = "#e0af68" })

			local function navigate_conflict(direction)
				if vim.fn.search([[^<<<<<<<]], "nw") == 0 then
					vim.notify("No git conflicts in this file", vim.log.levels.INFO)
					return
				end
				local plug = direction == "next"
					and "<Plug>(git-conflict-next-conflict)"
					or "<Plug>(git-conflict-prev-conflict)"
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(plug, true, false, true), "m", false)
			end

			vim.keymap.set("n", "[[", function() navigate_conflict("prev") end)
			vim.keymap.set("n", "]]", function() navigate_conflict("next") end)
		end,
	},
}
