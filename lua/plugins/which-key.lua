return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = 200,
		win = {
			border = "rounded",
			padding = { 1, 2 },
		},
		layout = {
			spacing = 4,
			align = "left",
		},
		icons = {
			mappings = false,
		},
		spec = {
			{ "<leader>b", group = "[S]earch", mode = { "n", "v" } },
			{ "<leader>i", group = "[I]nlay hints", mode = { "n", "v" } },
			{ "<leader>c", group = "[T]oggle" },
			{ "<leader>f", group = "[F]ind", mode = { "n", "v" } },
			{ "<leader>g", group = "[G]it", mode = { "n", "v" } },
			{ "<leader>l", group = "[L]sp", mode = { "n", "v" } },
			{ "<leader>n", group = "[N]Notifications", mode = { "n", "v" } },
			{ "<leader>r", group = "[R]un", mode = { "n", "v" } },
			{ "<leader>z", group = "[Z]enmode", mode = { "n", "v" } },
			{ "<leader>s", group = "[S]plit", mode = { "n", "v" } },
		}
	},
}
