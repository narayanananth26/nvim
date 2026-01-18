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
	local fg = "#1F2933"

	vim.api.nvim_set_hl(0, "CursorNormal", { fg = fg, bg = "#FF8A95" })
	vim.api.nvim_set_hl(0, "CursorInsert", { fg = fg, bg = "#82C785" })
	vim.api.nvim_set_hl(0, "CursorVisual", { fg = fg, bg = "#76A8F9" })
end

set_cursor_colors()

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = set_cursor_colors,
})

-- show commands in statusline
vim.opt.showcmd = true
vim.opt.showcmdloc = "statusline"

vim.opt.ignorecase = true
vim.opt.smartcase = true
