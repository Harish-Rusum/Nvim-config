-- PERF: setting up the preview in the whcih key menu

require("which-key").register({
	["<leader>t"] = { name = "Telescope/Terminal", _ = "which_key_ignore" },
	["<leader>b"] = { name = "Buffer", _ = "which_key_ignore" },
	["<leader>c"] = { name = "Code", _ = "which_key_ignore" },
	["<leader>z"] = { name = "ZenMode", _ = "which_key_ignore" },
	["<leader>h"] = { name = "Harpoon", _ = "which_key_ignore" },
	["<leader>f"] = { name = "Fold", _ = "which_key_ignore" },
	["<leader>s"] = { name = "Set", _ = "which_key_ignore" },
	["<leader>a"] = { name = "AI", _ = "which_key_ignore" },
	["<leader>v"] = { name = "Learn vim", _ = "which_key_ignore" },
	["<leader><leader>"] = { name = "Other", _ = "which_key_ignore" },
})

-- PERF: making which key have a rounder border

require("which-key").setup({
	window = {
		border = "rounded",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 2, 2, 2, 2 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	},
})
