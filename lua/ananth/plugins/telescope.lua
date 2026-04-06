return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
		},

		config = function()
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			local function show_commit(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd("Git show " .. selection.value)
			end

			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {},
				},
				pickers = {
					find_files = {
						hidden = true,
						no_ignore = false,
						find_command = {
							"fd",
							"--type",
							"f",
							"--hidden",
							"--no-ignore-vcs",
							"--exclude",
							".git",
							"--exclude",
							"node_modules",
						},
					},
					live_grep = {
						additional_args = { "--hidden", "--glob", "!.git", "--glob", "!node_modules" },
					},
					git_commits = {
						mappings = {
							i = { ["<CR>"] = show_commit },
							n = { ["<CR>"] = show_commit },
						},
					},
				},
			})

			require("telescope").load_extension("ui-select")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>gg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
			vim.keymap.set("n", "<leader>cc", builtin.git_commits, { desc = "Git commits" })
			vim.keymap.set("n", "<leader>b", builtin.git_branches, { desc = "Git branches" })
		end,
	},
}
