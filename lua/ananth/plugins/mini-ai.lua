return {
	{
		"nvim-mini/mini.ai",
		version = "*",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		opts = function()
			local ai = require("mini.ai")
			return {
				custom_textobjects = {
					f = ai.gen_spec.treesitter({
						a = "@function.outer",
						i = "@function.inner",
					}),
				},
			}
		end,
	},
}
