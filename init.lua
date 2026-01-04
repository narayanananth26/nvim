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
