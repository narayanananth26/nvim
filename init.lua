vim.o.termguicolors = true

require("ananth")

vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.swapfile = false

-- yank highlight
vim.api.nvim_create_autocmd("textyankpost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "incsearch", timeout = 150 })
	end,
})

-- cursor colors based on mode
vim.opt.guicursor = {
	"n:block-CursorNormal",
	"v:block-CursorVisual",
	"i-ci:block-CursorInsert-blinkon1",
	"r-cr:hor20-CursorReplace",
	"o:hor50-CursorOperator",
}

local function set_cursor_colors()
	-- Distinct somber colors for each mode from rose-pine palette
	-- Using light text for high visibility
	
	vim.api.nvim_set_hl(0, "CursorNormal", { fg = "#faf4ed", bg = "#b4637a" }) -- Reddish rose
	vim.api.nvim_set_hl(0, "CursorInsert", { fg = "#faf4ed", bg = "#56949f" }) -- Muted teal/pine (kept - looks great!)
	vim.api.nvim_set_hl(0, "CursorVisual", { fg = "#191724", bg = "#faf4ed" }) -- White with black fg
end

set_cursor_colors()

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = set_cursor_colors,
})

-- Enable cursorline for better cursor visibility
vim.opt.cursorline = true

-- show commands in statusline
vim.opt.showcmd = true
vim.opt.showcmdloc = "statusline"

vim.opt.ignorecase = true
vim.opt.smartcase = true
