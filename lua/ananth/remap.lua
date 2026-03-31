vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- write and quit
vim.keymap.set("n", "<leader>w", function()
	require("conform").format({ lsp_format = "fallback" })
	vim.cmd("write")
end, { desc = "Write and format" })
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>z", function()
	require("conform").format({ lsp_format = "fallback" })
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
vim.keymap.set("n", "<leader>lf", function()
	require("conform").format({ lsp_format = "fallback" })
end, { desc = "Format buffer" })

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

-- open :messages in a navigable scratch buffer
vim.keymap.set("n", "<leader>m", function()
	vim.schedule(function()
		local output = vim.api.nvim_exec2("messages", { output = true }).output
		local lines = vim.split(output, "\n")
		vim.cmd("botright new")
		local buf = vim.api.nvim_get_current_buf()
		vim.bo[buf].buftype = "nofile"
		vim.bo[buf].buflisted = false
		vim.bo[buf].modifiable = true
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
		vim.bo[buf].modifiable = false
		vim.api.nvim_win_set_cursor(0, { #lines, 0 })
		vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
	end)
end, { desc = "Open messages buffer" })

-- alias :git to :Git (fugitive)
vim.cmd([[
				cnoreabbrev <expr> git getcmdtype() == ":" ? "Git" : "git"
]])

-- git keymaps
vim.keymap.set("n", "<leader>gs", "<cmd>Git | only<CR>", { desc = "Git Status" })
vim.keymap.set("n", ",,", "<C-^>", { desc = "Toggle buffers" })
