vim.o.termguicolors = true

require("ananth")

vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.swapfile = false

-- Fast ESC response (no delay)
vim.opt.timeoutlen = 300    -- Time to wait for mapped sequence (ms)
vim.opt.ttimeoutlen = 10    -- Time to wait for key code sequence (ms)

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

-- Better split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Highlight active window splits
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#524f67" }) -- Muted from rose-pine

-- Equalize splits automatically
vim.opt.equalalways = false

-- Always show signcolumn to prevent text shifting
vim.opt.signcolumn = "yes"

-- Number column width
vim.opt.numberwidth = 3

-- Highlight current line number differently
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#eb6f92", bold = true }) -- Rose color

-- Better fold column
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Winbar showing current file path
vim.opt.winbar = "%=%m %f"


-- Better window separators
vim.opt.fillchars = {
  fold = " ",
  foldopen = "",
  foldclose = "",
  foldsep = " ",
  diff = "╱",
  eob = " ",
  vert = "│",
  horiz = "─",
}

-- Bordered floating windows globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end