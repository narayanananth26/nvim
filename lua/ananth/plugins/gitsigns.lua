return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gs = require("gitsigns")
				local function map(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
				end

				local function map_nav()
					map("]]", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]c", bang = true })
						else
							gs.nav_hunk("next")
						end
					end, "Next git hunk")

					map("[[", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[c", bang = true })
						else
							gs.nav_hunk("prev")
						end
					end, "Prev git hunk")
				end

				map_nav()

				-- ftplugins (e.g. go.vim) set buffer-local ]] / [[ and can override ours
				vim.api.nvim_create_autocmd("FileType", {
					buffer = bufnr,
					callback = function()
						vim.schedule(map_nav)
					end,
				})

				map("<leader>ga", gs.stage_hunk, "Stage/unstage hunk")
				map("<leader>gr", gs.reset_hunk, "Reset hunk")
				map("<leader>gp", gs.preview_hunk, "Preview hunk")
				map("<leader>gA", gs.stage_buffer, "Stage buffer")
				map("<leader>gb", function()
					gs.blame_line({ full = true })
				end, "Blame line")

				vim.keymap.set("v", "<leader>ga", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { buffer = bufnr, desc = "Stage selected lines" })
				vim.keymap.set("v", "<leader>gr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { buffer = bufnr, desc = "Reset selected lines" })
			end,
		})
	end,
}
