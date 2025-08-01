return {
	{
		"rmagatti/auto-session",
		lazy = false,

		opts = {
			allowed_dirs = { "~/projects/*" },
		},
	},
	{
		"saghen/blink.cmp",
		opts = {
			keymap = {
				preset = "enter",
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
			},
		},
	},
	{
		-- uv integration
		"benomahony/uv.nvim",
		opts = {
			picker_integration = false,
			keymaps = false,
		},
	},
}
