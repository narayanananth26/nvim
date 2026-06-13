return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- nvim-cmp still calls vim.lsp.util.stylize_markdown, which is
			-- deprecated and will be removed in nvim 0.14. Until cmp fixes it
			-- upstream, replace it with the treesitter-based rendering that
			-- vim.lsp.util.open_floating_preview uses internally.
			vim.lsp.util.stylize_markdown = function(bufnr, contents, opts)
				opts = opts or {}
				contents = vim.lsp.util._normalize_markdown(contents, { width = opts.max_width })
				vim.bo[bufnr].filetype = "markdown"
				vim.treesitter.start(bufnr)
				vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, contents)
				vim.schedule(function()
					local win = vim.fn.bufwinid(bufnr)
					if win ~= -1 then
						vim.wo[win].conceallevel = 2
					end
				end)
				return contents
			end

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				preselect = cmp.PreselectMode.None,
				completion = {
					completeopt = "menu,menuone,noselect",
				},
				window = {
					completion = {
						border = "rounded",
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
						scrollbar = true,
					},
					documentation = {
						border = "rounded",
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu",
						max_height = 15,
						max_width = 60,
					},
				},
				mapping = {
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				},
				sources = {
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
				},
				experimental = {
					ghost_text = true,
				},
			})

			cmp.setup.filetype({ "typescriptreact", "javascriptreact" }, {
				sources = {
					{ name = "luasnip" },
					{
						name = "nvim_lsp",
						entry_filter = function(entry)
							return entry:get_kind() ~= require("cmp.types").lsp.CompletionItemKind.Snippet
						end,
					},
				},
			})

			local cmdline_mapping = cmp.mapping.preset.cmdline({
				["<Down>"] = {
					c = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end,
				},
				["<Up>"] = {
					c = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end,
				},
			})

			cmp.setup.cmdline("/", {
				mapping = cmdline_mapping,
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmdline_mapping,
				sources = cmp.config.sources({ { name = "path" } }, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})
		end,
	},
}
