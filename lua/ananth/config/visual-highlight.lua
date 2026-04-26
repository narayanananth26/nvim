local M = {}

local match_ids = {} -- { [winid] = match_id }
local last_pattern = nil

vim.api.nvim_set_hl(0, "VisualMatch", { link = "Search", default = true })

local function clear()
	for winid, id in pairs(match_ids) do
		if vim.api.nvim_win_is_valid(winid) then
			pcall(vim.fn.matchdelete, id, winid)
		end
	end
	match_ids = {}
	last_pattern = nil
end

local function get_selection()
	local mode = vim.fn.mode()
	if mode ~= "v" then
		return nil
	end -- charwise only; skip V and <C-v>

	local s = vim.fn.getpos("v")
	local e = vim.fn.getpos(".")
	if s[2] ~= e[2] then
		return nil
	end -- single line only

	local srow, scol = s[2], s[3]
	local _, ecol = e[2], e[3]
	if scol > ecol then
		scol, ecol = ecol, scol
	end

	local line = vim.api.nvim_buf_get_lines(0, srow - 1, srow, false)[1] or ""
	local sel = line:sub(scol, ecol)

	if #sel < 2 or sel:match("^%s*$") then
		return nil
	end
	return sel
end

local function refresh()
	local sel = get_selection()
	if not sel then
		clear()
		return
	end

	local pattern = [[\V]] .. vim.fn.escape(sel, [[\]])
	if pattern == last_pattern and match_ids[vim.api.nvim_get_current_win()] then
		return
	end

	clear()
	last_pattern = pattern
	local winid = vim.api.nvim_get_current_win()
	match_ids[winid] = vim.fn.matchadd("VisualMatch", pattern, -1)
end

local group = vim.api.nvim_create_augroup("VisualHighlight", { clear = true })

vim.api.nvim_create_autocmd({ "CursorMoved", "ModeChanged" }, {
	group = group,
	callback = function()
		if vim.fn.mode() == "v" then
			refresh()
		else
			clear()
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
	group = group,
	callback = clear,
})

return M
