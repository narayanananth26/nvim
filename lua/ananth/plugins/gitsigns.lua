return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gs = require("gitsigns")
				local function map(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
				end

				map("]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gs.nav_hunk("next")
					end
				end, "Next git hunk")

				map("[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gs.nav_hunk("prev")
					end
				end, "Prev git hunk")

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
