local telescope = require("telescope")

telescope.setup({
	defaults = {
		-- PERF: Telescope layout config

		layout_config = {
			horizontal = {
				prompt_position = "bottom",
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
-- ❱ 
		layout_strategy = "horizontal",
		sorting_strategy = "ascending",
		prompt_prefix = " ",
		selection_caret = "▶ ",
		entry_prefix = "  ",
		initial_mode = "insert",
		border = true,
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		winblend = 0,
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" },
	},
})

-- Custom colorscheme picker function with preview
function _G.colorscheme_picker()
	require("telescope.pickers")
			.new({}, {
				prompt_title = "Colorscheme Picker",
				finder = require("telescope.finders").new_table({
					results = vim.fn.getcompletion("", "color"),
					entry_maker = function(entry)
						return {
							value = entry,
							display = entry,
							ordinal = entry,
						}
					end,
				}),
				sorter = require("telescope.config").values.generic_sorter({}),
				previewer = require("telescope.previewers").new_buffer_previewer({
					define_preview = function(self, entry, status)
						vim.cmd("colorscheme " .. entry.value)
						local example_code = [[
def quicksort(arr):
		if len(arr) <= 1:
				return arr
		pivot = arr[len(arr) // 2]
		left = [x for x in arr if x < pivot]
		middle = [x for x in arr if x == pivot]
		right = [x for x in arr if x > pivot]
		return quicksort(left) + middle + quicksort(right)

print(quicksort([3,6,8,10,1,2,1]))
				]]

						vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, vim.split(example_code, "\n"))
						vim.api.nvim_buf_set_option(self.state.bufnr, "filetype", "python")
					end,
				}),
				attach_mappings = function(prompt_bufnr, map)
					local function change_colorscheme()
						local entry = require("telescope.actions.state").get_selected_entry()
						vim.cmd("colorscheme " .. entry.value)
					end

					-- Update the colorscheme when the selection changes
					map("i", "<CR>", function()
						change_colorscheme()
						require("telescope.actions").close(prompt_bufnr)
					end)
					map("i", "<Down>", function()
						require("telescope.actions").move_selection_next(prompt_bufnr)
						change_colorscheme()
					end)
					map("i", "<Up>", function()
						require("telescope.actions").move_selection_previous(prompt_bufnr)
						change_colorscheme()
					end)
					return true
				end,
			})
			:find()
end
