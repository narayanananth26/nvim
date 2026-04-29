return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.opt.showtabline = 2

		local function harpoon_tabline()
			local list = harpoon:list()
			local items = list.items or {}
			local current = vim.api.nvim_buf_get_name(0)
			local cwd = vim.uv.cwd() or vim.fn.getcwd()
			local parts = {}
			for i, item in ipairs(items) do
				local abs = vim.fn.fnamemodify(cwd .. "/" .. item.value, ":p")
				local name = vim.fn.fnamemodify(item.value, ":t")
				local hl = (abs == current) and "%#TabLineSel#" or "%#TabLine#"
				table.insert(parts, hl .. " " .. i .. ":" .. name .. " ")
			end
			if #parts == 0 then
				return "%#TabLineFill# harpoon: empty "
			end
			return table.concat(parts, "%#TabLineFill# ") .. "%#TabLineFill#"
		end

		_G.HarpoonTabline = harpoon_tabline
		vim.o.tabline = "%!v:lua.HarpoonTabline()"

		harpoon:extend({
			LIST_CHANGE = function()
				vim.cmd.redrawtabline()
			end,
			ADD = function()
				vim.cmd.redrawtabline()
			end,
			REMOVE = function()
				vim.cmd.redrawtabline()
			end,
		})
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			callback = function()
				vim.cmd.redrawtabline()
			end,
		})

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
			vim.notify("Harpoon: added " .. vim.fn.expand("%:t"), vim.log.levels.INFO)
		end, { desc = "Harpoon add file" })
		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon menu" })

		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon file 1" })
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon file 2" })
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon file 3" })
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon file 4" })
		vim.keymap.set("n", "<leader>5", function()
			harpoon:list():select(5)
		end, { desc = "Harpoon file 5" })
		vim.keymap.set("n", "<leader>6", function()
			harpoon:list():select(6)
		end, { desc = "Harpoon file 6" })
		vim.keymap.set("n", "<leader>7", function()
			harpoon:list():select(7)
		end, { desc = "Harpoon file 7" })
		vim.keymap.set("n", "<leader>8", function()
			harpoon:list():select(8)
		end, { desc = "Harpoon file 8" })
	end,
}
