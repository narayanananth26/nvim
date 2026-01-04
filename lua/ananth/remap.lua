vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>ex', vim.cmd.Ex)
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Open Lazy.nvim" })
vim.keymap.set("n", "<leader>so", ":update<CR> :source<CR>", { desc = "Open Lazy.nvim" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')

