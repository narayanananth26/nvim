local function show_diff(qf_cmd)
	if not pcall(vim.cmd, qf_cmd) then
		vim.notify("No more changed files", vim.log.levels.INFO)
		return
	end
	vim.cmd("only")
	vim.cmd("Gvdiffsplit")
end

return {
	{
		"tpope/vim-fugitive",
		lazy = false,
		keys = {
			{
				"<leader>gd",
				function()
					vim.cmd("Git difftool")
					show_diff("cfirst")
				end,
				desc = "Diff changed files (start)",
			},
			{
				"<leader>gD",
				function()
					vim.cmd("Git difftool --staged")
					show_diff("cfirst")
				end,
				desc = "Diff staged files (start)",
			},
			{
				"]f",
				function()
					show_diff("cnext")
				end,
				desc = "Next diff file",
			},
			{
				"[f",
				function()
					show_diff("cprev")
				end,
				desc = "Previous diff file",
			},
		},
	},
}
