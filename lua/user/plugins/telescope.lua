local telescope = require("telescope")

telescope.setup({
	defaults = {
		-- PERF: Telescope layout layout config

		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.5,
				results_width = 0.8,
				width = 0.95,
				height = 0.85,
			},
			vertical = {
				mirror = false,
				width = 0.95,
				height = 0.85,
			},
			center = {
				width = 0.95,
				height = 0.85,
			},
		},

		-- PERF: Telescope icons and borders

		layout_strategy = "horizontal",
		sorting_strategy = "ascending",
		prompt_prefix = "❱ ",
		selection_caret = "▶ ",
		entry_prefix = "  ",
		initial_mode = "insert",
		border = true,
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		-- winblend = 0,
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" },
	},
})
