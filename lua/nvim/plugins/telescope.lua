-- PERF: Setting up telescope (fuzzy finder)

local telescope = require("telescope")

telescope.setup({
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
	},
	defaults = {
		-- PERF: Telescope layout config
		layout_config = {
			horizontal = {
				prompt_position = "bottom",
				-- preview_width = 0.4,
				-- results_width = 0.8,
				-- width = 0.85,
				-- height = 0.9,
			},
			vertical = {
				mirror = false,
				-- width = 0.85,
				-- height = 0.9,
			},
			center = {
				-- width = 0.85,
				-- height = 0.9,
			},
		},

		-- PERF: Telescope icons and borders
		-- ❱
		layout_strategy = "horizontal",
		sorting_strategy = "descending",
		prompt_prefix = " ",
		selection_caret = "▶ ",
		entry_prefix = "  ",
		initial_mode = "insert",
		border = true,
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		-- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		winblend = 0,
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" },
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
