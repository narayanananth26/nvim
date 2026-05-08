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
      highlight LazyNormal guibg=NONE ctermbg=NONE
      highlight MasonNormal guibg=NONE ctermbg=NONE
      highlight TelescopeNormal guibg=NONE ctermbg=NONE
      highlight TelescopeBorder guibg=NONE ctermbg=NONE
      highlight WhichKeyFloat guibg=NONE ctermbg=NONE
      highlight StatusLine guibg=NONE ctermbg=NONE
      highlight StatusLineNC guibg=NONE ctermbg=NONE
      highlight TabLine guibg=NONE ctermbg=NONE
      highlight TabLineFill guibg=NONE ctermbg=NONE
      highlight TabLineSel guibg=NONE ctermbg=NONE
      highlight MiniStatuslineDevinfo guibg=NONE ctermbg=NONE
      highlight MiniStatuslineFilename guibg=NONE ctermbg=NONE
      highlight MiniStatuslineFileinfo guibg=NONE ctermbg=NONE
      highlight MiniStatuslineInactive guibg=NONE ctermbg=NONE
      highlight WinBar guibg=NONE ctermbg=NONE
      highlight WinBarNC guibg=NONE ctermbg=NONE
      highlight Pmenu guibg=NONE ctermbg=NONE
      highlight PmenuSbar guibg=NONE ctermbg=NONE
      highlight PmenuThumb guibg=NONE ctermbg=NONE
      highlight TroubleNormal guibg=NONE ctermbg=NONE
      highlight TroubleNormalNC guibg=NONE ctermbg=NONE
      highlight TroubleText guibg=NONE ctermbg=NONE
      highlight TroubleIndent guibg=NONE ctermbg=NONE
    ]])

		-- Search highlights (distinct rose-pine colors, somber and visible)
		vim.api.nvim_set_hl(0, "IncSearch", { fg = "#191724", bg = "#eb6f92", bold = true }) -- Rose/love
		vim.api.nvim_set_hl(0, "Search", { fg = "#191724", bg = "#c4a7e7" }) -- Iris/purple
		vim.api.nvim_set_hl(0, "CurSearch", { fg = "#191724", bg = "#f6c177", bold = true }) -- Gold/amber

		-- Visual selection: readable text on muted highlight bg
		vim.api.nvim_set_hl(0, "Visual", { fg = "#e0def4", bg = "#403d52" }) -- Text on highlight_med

		-- Flash.nvim: distinct cursor (foam) vs matches (iris), no orange clash
		vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#191724", bg = "#c4a7e7" }) -- Iris/purple
		vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#191724", bg = "#9ccfd8", bold = true }) -- Foam/cyan
		vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#191724", bg = "#9ccfd8", bold = true })
	end,
}
