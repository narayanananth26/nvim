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

		vim.api.nvim_set_hl(0, "IncSearch", {
			bg = "#FF8A95",
			fg = "#1A1A1A",
		})
	end,
}
