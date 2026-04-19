vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- write and quit
vim.keymap.set("n", "<leader>w", function()
	require("conform").format({ lsp_format = "fallback" })
	vim.cmd("write")
end, { desc = "Write and format" })
vim.keymap.set("n", "<leader>q", function()
	vim.cmd("quit")
end, { desc = "Quit" })
vim.keymap.set("n", "<leader>z", function()
	require("conform").format({ lsp_format = "fallback" })
	vim.cmd("write")
	vim.cmd("quit")
end, { desc = "Format, write, and quit" })

-- source file
vim.keymap.set("n", "<leader>so", ":update<CR> :source<CR>", { desc = "Open Lazy.nvim" })

-- clipboard keymaps
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')

-- clear search highlight (using <leader><CR> instead of <Esc><Esc> to avoid ESC delay)
vim.keymap.set("n", "<leader><CR>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })

-- move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>o", ":only<CR>", { silent = true, desc = "Close all other windows" })

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
		vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
		vim.api.nvim_win_set_cursor(0, { #lines, 0 })
	end)
end, { desc = "Open messages buffer" })

-- alias :git to :Git (fugitive)
vim.cmd([[
				cnoreabbrev <expr> git getcmdtype() == ":" ? "Git" : "git"
]])

-- git push --force
vim.keymap.set("n", "gpf", function()
	vim.notify("git push --force...", vim.log.levels.INFO)
	vim.system({ "git", "push", "--force" }, { text = true }, function(result)
		vim.schedule(function()
			if result.code == 0 then
				vim.notify("Push done", vim.log.levels.INFO)
			else
				vim.notify("Push failed:\n" .. (result.stderr or ""), vim.log.levels.ERROR)
			end
		end)
	end)
end, { desc = "Git push force (async)" })

-- git keymaps
vim.keymap.set("n", "<leader>gs", "<cmd>Git | only<CR>", { desc = "Git Status" })
vim.keymap.set("n", ",,", "<C-^>", { desc = "Toggle buffers" })

-- resize splits (directional: move the border in the pressed direction)
vim.keymap.set("n", "<M-Up>", "<cmd>resize +2<CR>", { silent = true, desc = "Move border up" })
vim.keymap.set("n", "<M-Down>", "<cmd>resize -2<CR>", { silent = true, desc = "Move border down" })
vim.keymap.set("n", "<M-Right>", function()
	local is_rightmost = vim.fn.winnr() == vim.fn.winnr("l")
	vim.cmd(is_rightmost and "vertical resize -2" or "vertical resize +2")
end, { silent = true, desc = "Move border right" })
vim.keymap.set("n", "<M-Left>", function()
	local is_leftmost = vim.fn.winnr() == vim.fn.winnr("h")
	vim.cmd(is_leftmost and "vertical resize -2" or "vertical resize +2")
end, { silent = true, desc = "Move border left" })

-- quifix
vim.keymap.set("n", "]q", ":cnext<CR>", { desc = "Quickfix next" })
vim.keymap.set("n", "[q", ":cprev<CR>", { desc = "Quickfix prev" })

-- select all
vim.keymap.set("n", "<leader>a", "gg0vG$", { desc = "Visually select entire buffer" })

-- move line up/down
vim.keymap.set("n", "<M-k>", "<cmd>move .-2<CR>==", { silent = true, desc = "Move line up" })
vim.keymap.set("n", "<M-j>", "<cmd>move .+1<CR>==", { silent = true, desc = "Move line down" })
vim.keymap.set("v", "<M-k>", ":move '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })
vim.keymap.set("v", "<M-j>", ":move '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })

-- duplicate line up/down
vim.keymap.set("n", "<S-M-k>", "yyP", { silent = true, desc = "Duplicate line up" })
vim.keymap.set("n", "<S-M-j>", "yyp", { silent = true, desc = "Duplicate line down" })
vim.keymap.set("v", "<S-M-k>", "y`<Pgv", { silent = true, desc = "Duplicate selection up" })
vim.keymap.set("v", "<S-M-k>", "y`>pgv", { silent = true, desc = "Duplicate selection down" })
