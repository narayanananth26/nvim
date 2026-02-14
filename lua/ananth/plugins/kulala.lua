return {
	{
		"mistweaverco/kulala.nvim",
		ft = "http",
		keys = {
			{ "<leader>kr", "<cmd>lua require('kulala').run()<CR>", desc = "Run HTTP request" },
			{ "<leader>ka", "<cmd>lua require('kulala').run_all()<CR>", desc = "Run all HTTP requests" },
			{ "<leader>ki", "<cmd>lua require('kulala').inspect()<CR>", desc = "Inspect HTTP request" },
			{ "<leader>kt", "<cmd>lua require('kulala').toggle_view()<CR>", desc = "Toggle HTTP response view" },
			{ "<leader>kc", "<cmd>lua require('kulala').copy()<CR>", desc = "Copy HTTP request as cURL" },
			{ "<leader>ks", "<cmd>lua require('kulala').scratchpad()<CR>", desc = "Open HTTP scratchpad" },
		},
		config = function()
			require("kulala").setup({
				-- Default options
				default_view = "body", -- body, headers, headers_body
				default_env = "dev", -- default environment
				debug = false,
				contenttypes = {
					["application/json"] = {
						ft = "json",
						formatter = { "jq", "." },
					},
					["application/xml"] = {
						ft = "xml",
						formatter = { "xmllint", "--format", "-" },
					},
					["text/html"] = {
						ft = "html",
						formatter = { "xmllint", "--format", "--html", "-" },
					},
				},
			})
		end,
	},
}
