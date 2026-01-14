local M = {}

M.setup = {
	-- Disable in prompts / special buffers
	disable_filetype = {
		"TelescopePrompt",
		"spectre_panel",
		"snacks_picker_input",
	},

	-- Safer defaults
	disable_in_macro = true,
	disable_in_replace_mode = true,

	-- Behavior
	enable_moveright = true,
	enable_afterquote = true,
	enable_check_bracket_line = true,
	enable_bracket_in_quote = true,

	-- Keymaps
	map_cr = true,
	map_bs = true,

	-- Treesitter-aware pairing
	check_ts = true,
	ts_config = {
		lua = { "string" },
		javascript = { "template_string" },
		typescript = { "template_string" },
		java = false,
	},

	-- Ignore pairing if next char is alphanumeric or `.`
	ignored_next_char = "[%w%.]",
}

return M.setup
