vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- write and quit
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

-- :Ex
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- :Lazy
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Open Lazy.nvim" })

-- source file
vim.keymap.set("n", "<leader>so", ":update<CR> :source<CR>", { desc = "Open Lazy.nvim" })

-- language format 
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- clipboard keymaps 
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')

-- neo-tree toggle
vim.keymap.set("n", "<leader>b", ":Neotree toggle<CR>", { silent = true })
