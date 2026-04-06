vim.o.termguicolors = true

require("ananth")

vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.swapfile = false

vim.opt.timeoutlen = 300 -- Time to wait for mapped sequence (ms)ini
vim.opt.ttimeoutlen = 10 -- Time to wait for key code sequence (ms)

-- yank highlight
vim.api.nvim_create_autocmd("textyankpost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "incsearch", timeout = 150 })
  end,
})

-- line cursor in insert mode, block otherwise
vim.opt.guicursor = {
	"n-v-c:block",
	"i-ci-ve:ver25",
	"r-cr:hor20",
	"o:hor50",
}

vim.opt.showmode = true

-- Scroll offset
vim.o.scrolloff = 12

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
	foldopen = "v",
	foldclose = ">",
	foldsep = " ",
	diff = "╱",
	eob = " ",
	vert = "│",
	horiz = "─",
}

-- Bordered floating windows globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or "rounded"
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Auto save on focus change
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
	group = vim.api.nvim_create_augroup("AutoSave", { clear = true }),
	desc = "Auto save on focus change",
	callback = function()
		if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
			vim.cmd("silent! w")
		end
	end,
})
