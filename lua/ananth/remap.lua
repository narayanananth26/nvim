vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- write and quit
vim.keymap.set("n", "<leader>w", function()
	vim.cmd("write")
	vim.lsp.buf.format()
end, { desc = "Write and format" })
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

-- clear search highlight
vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Next buffer 
vim.keymap.set("n", "<C-Tab>", ":bnext<CR>", { silent = true })

-- Previous buffer 
vim.keymap.set("n", "<C-S-Tab>", ":bprevious<CR>", { silent = true })
