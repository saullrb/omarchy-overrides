return {
	{
		"rmagatti/auto-session",
		lazy = false,

		opts = {
			allowed_dirs = { "~/projects/*", "~/.local/share/omarchy/", "~/.local/share/omarchy-overrides/" },
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
}
