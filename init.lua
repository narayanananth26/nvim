require("ananth")

vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.winborder = "rounded"

-- yank highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 150 }
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
  vim.api.nvim_set_hl(0, "CursorNormal", { fg = "#000000", bg = "#FF8A95" })
  vim.api.nvim_set_hl(0, "CursorInsert", { fg = "#000000", bg = "#82c785" })
  vim.api.nvim_set_hl(0, "CursorVisual", { fg = "#000000", bg = "#76a8f9" })
end

set_cursor_colors()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_cursor_colors,
})

-- show commands in statusline
vim.opt.showcmd = true
vim.opt.showcmdloc = "statusline"
