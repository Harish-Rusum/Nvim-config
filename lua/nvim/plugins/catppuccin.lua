-- PERF: catppuccin theme settings

require("catppuccin").setup({
	flavour = "mocha",
	background = {
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false,
	show_end_of_buffer = false,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
	},
})

vim.o.fillchars = "eob: "
