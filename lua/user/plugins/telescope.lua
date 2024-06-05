local telescope = require('telescope')
local z_utils = require("telescope._extensions.zoxide.utils")

telescope.setup{
	extensions = {
		zoxide = {
			prompt_title = "[ Walking on the shoulders of TJ ]",
			mappings = {
				default = {
					after_action = function(selection)
						print("Update to (" .. selection.z_score .. ") " .. selection.path)
					end
				},
				["<C-s>"] = {
					before_action = function(selection) print("before C-s") end,
					action = function(selection)
						vim.cmd.edit(selection.path)
					end
				},
				-- Opens the selected entry in a new split
				["<C-q>"] = { action = z_utils.create_basic_command("split") },
			},
		}
	},
	defaults = {
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
		layout_strategy = "horizontal",
		sorting_strategy = "ascending",
		prompt_prefix = "❱ ",
		selection_caret = "▶ ",
		entry_prefix = "  ",
		initial_mode = "insert",
		border = true,
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }, -- Rounded borders
		winblend = 0,  -- Adjust this for transparency level
		color_devicons = true,
		use_less = true,
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil
	}
}

require("telescope").load_extension "zoxide"
