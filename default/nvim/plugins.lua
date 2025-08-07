return {
	{
		"GustavEikaas/easy-dotnet.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
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
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			picker = {
				sources = {
					explorer = {
						win = {
							list = {
								keys = {
									["A"] = "explorer_add_dotnet",
								},
							},
						},
						actions = {
							explorer_add_dotnet = function(picker)
								local dir = picker:dir()
								local tree = require("snacks.explorer.tree")
								local actions = require("snacks.explorer.actions")
								local easydotnet = require("easy-dotnet")

								easydotnet.create_new_item(dir, function(item_path)
									tree:open(dir)
									tree:refresh(dir)
									actions.update(picker, { target = item_path })
								end)
							end,
						},
					},
				},
			},
		},
	},
}
