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

			-- send picker results to the quickfix list, then open it in Trouble
			local function send_to_trouble(prompt_bufnr)
				actions.send_to_qflist(prompt_bufnr)
				vim.cmd("Trouble qflist open")
			end

			require("telescope").load_extension("fzf")

			require("telescope").setup({
				defaults = {
					mappings = {
						i = { ["<C-q>"] = send_to_trouble },
						n = { ["<C-q>"] = send_to_trouble },
					},
					file_ignore_patterns = {},
					layout_strategy = "vertical",
					layout_config = {
						vertical = {
							width = { padding = 0 },
							height = { padding = 0 },
							preview_height = 0.6,
						},
					},
				},
				pickers = {
					find_files = {
						hidden = true,
						-- Respect .gitignore for everything, but force .env files back in.
						-- Two fd passes (normal + forced .env*) deduped with awk.
						find_command = {
							"sh",
							"-c",
							"{ fd --type f --hidden --exclude .git --exclude node_modules; "
								.. "fd --type f --hidden --no-ignore-vcs --exclude .git --exclude node_modules --glob '.env*'; } "
								.. "| awk '!seen[$0]++'",
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

			vim.keymap.set("n", "<leader>fd", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>jk", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>ht", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>c", builtin.git_commits, { desc = "Git commits" })
			vim.keymap.set("n", "<leader>b", builtin.git_branches, { desc = "Git branches" })
		end,
	},
}
