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

		-- Search highlights (contrasting but harmonious)
		vim.api.nvim_set_hl(0, "IncSearch", { fg = "#1F2933", bg = "#FF5C6A" }) -- darker pink
		vim.api.nvim_set_hl(0, "Search", { fg = "#1F2933", bg = "#4BB86B" }) -- darker green
		vim.api.nvim_set_hl(0, "CurSearch", { fg = "#1F2933", bg = "#4F7DEB" }) -- darker blue
	end,
}
