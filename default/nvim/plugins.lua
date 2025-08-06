return {
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
		"GustavEikaas/easy-dotnet.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = function()
			require("easy-dotnet").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			}
		end,
	},
	{
		"seblyng/roslyn.nvim",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			-- your configuration comes here; leave empty for default settings
		},
	},
}
