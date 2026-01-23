return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			disable_background = true,
		})

		vim.cmd("colorscheme rose-pine")

		vim.cmd([[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight NormalFloat guibg=NONE ctermbg=NONE
      highlight FloatBorder guibg=NONE ctermbg=NONE
      highlight EndOfBuffer guibg=NONE ctermbg=NONE
    ]])

		-- Search highlights (distinct rose-pine colors, somber and visible)
		vim.api.nvim_set_hl(0, "IncSearch", { fg = "#191724", bg = "#eb6f92", bold = true }) -- Rose/love
		vim.api.nvim_set_hl(0, "Search", { fg = "#191724", bg = "#c4a7e7" }) -- Iris/purple
		vim.api.nvim_set_hl(0, "CurSearch", { fg = "#191724", bg = "#f6c177", bold = true }) -- Gold/amber
	end,
}
