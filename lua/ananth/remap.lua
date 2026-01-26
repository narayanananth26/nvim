vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- write and quit
vim.keymap.set("n", "<leader>w", function()
	vim.cmd("write")
	vim.lsp.buf.format()
end, { desc = "Write and format" })
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>z", function()
	vim.lsp.buf.format()
	vim.cmd("write")
	vim.cmd("quit")
end, { desc = "Format, write, and quit" })

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

-- clear search highlight (using <leader><CR> instead of <Esc><Esc> to avoid ESC delay)
vim.keymap.set("n", "<leader><CR>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })

-- move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- buffer navigation (VSCode-like)
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<leader><Tab>", ":Telescope buffers<CR>", { silent = true, desc = "Buffer picker" })

-- git keymaps
vim.keymap.set("n", "<leader>gs", "<cmd>0G<CR>", { desc = "Git Status" })
vim.keymap.set("n", ",,", "<C-^>", { desc = "Toggle buffers" })
