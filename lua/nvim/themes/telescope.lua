local function transparent()
	local telescope_highlights = {
		TelescopePromptTitle = { bg = "none", fg = "#89b5fa" },
		TelescopeResultsTitle = { bg = "none", fg = "#89b5fa" },
		TelescopePreviewTitle = { bg = "none", fg = "#89b5fa" },
		TelescopePromptPrefix = { bg = "none", fg = "#bec6e4" },
		TelescopePromptNormal = { bg = "none", fg = "#bec6e4" },
		TelescopeResultsNormal = { bg = "none", fg = "#bec6e4" },
		TelescopeResultsBorder = { bg = "none", fg = "#89b5fa" },
		TelescopePromptBorder = { bg = "none", fg = "#89b5fa" },
		TelescopePreviewNormal = { bg = "none", fg = "#89b5fa" },
		TelescopePreviewBorder = { bg = "none", fg = "#89b5fa" },
	}

	for hl, col in pairs(telescope_highlights) do
		vim.api.nvim_set_hl(0, hl, col)
	end
end

local function titles()
	local colors = require("catppuccin.palettes").get_palette("mocha")

	local function darken(color, percentage)
		local r = tonumber(color:sub(2, 3), 16)
		local g = tonumber(color:sub(4, 5), 16)
		local b = tonumber(color:sub(6, 7), 16)
		r = math.floor(r * (1 - percentage / 100))
		g = math.floor(g * (1 - percentage / 100))
		b = math.floor(b * (1 - percentage / 100))
		return string.format("#%02x%02x%02x", r, g, b)
	end

	local darken_percentage = 5

	local telescope_highlights = {
		TelescopePromptTitle = { bg = colors.red, fg = darken(colors.mantle, darken_percentage) },
		TelescopeResultsTitle = { fg = darken(colors.mantle, darken_percentage), bg = colors.green },
		TelescopePreviewTitle = { bg = colors.teal, fg = darken(colors.mantle, darken_percentage) },
		TelescopePromptPrefix = { bg = "none", fg = "#bec6e4" },
		TelescopePromptNormal = { bg = "none", fg = "#bec6e4" },
		TelescopeResultsNormal = { bg = "none", fg = "#bec6e4" },
		TelescopeResultsBorder = { bg = "none", fg = "#89b5fa" },
		TelescopePromptBorder = { bg = "none", fg = "#89b5fa" },
		TelescopePreviewNormal = { bg = "none", fg = "#89b5fa" },
		TelescopePreviewBorder = { bg = "none", fg = "#89b5fa" },
	}

	for hl, col in pairs(telescope_highlights) do
		vim.api.nvim_set_hl(0, hl, col)
	end
end

local function full()
	local colors = require("catppuccin.palettes").get_palette("mocha")

	local function darken(color, percentage)
		local r = tonumber(color:sub(2, 3), 16)
		local g = tonumber(color:sub(4, 5), 16)
		local b = tonumber(color:sub(6, 7), 16)
		r = math.floor(r * (1 - percentage / 100))
		g = math.floor(g * (1 - percentage / 100))
		b = math.floor(b * (1 - percentage / 100))
		return string.format("#%02x%02x%02x", r, g, b)
	end

	local darken_percentage = 5

	local telescope_highlights = {
		TelescopePromptNormal = { bg = darken(colors.surface0, darken_percentage) },
		TelescopePromptBorder = {
			bg = darken(colors.surface0, darken_percentage),
			fg = darken(colors.surface0, darken_percentage),
		},
		TelescopePromptTitle = { bg = colors.red, fg = darken(colors.mantle, darken_percentage) },
		TelescopePromptPrefix = { bg = darken(colors.surface0, darken_percentage), fg = colors.red },
		TelescopeResultsNormal = { bg = darken(colors.mantle, darken_percentage) },
		TelescopeResultsBorder = {
			bg = darken(colors.mantle, darken_percentage),
			fg = darken(colors.mantle, darken_percentage),
		},
		TelescopeResultsTitle = { fg = darken(colors.mantle, darken_percentage), bg = colors.green },
		TelescopePreviewNormal = { bg = darken(colors.base, darken_percentage) },
		TelescopePreviewBorder = {
			bg = darken(colors.base, darken_percentage),
			fg = darken(colors.base, darken_percentage),
		},
		TelescopePreviewTitle = { bg = colors.teal, fg = darken(colors.mantle, darken_percentage) },
	}

	for hl, col in pairs(telescope_highlights) do
		vim.api.nvim_set_hl(0, hl, col)
	end
end

local function apply_theme(theme_label)
	if theme_label == "Full transparency" then
		transparent()
	elseif theme_label == "Only titles colored" then
		titles()
	elseif theme_label == "All elements customized" then
		full()
	end
end

local theme_file_path = vim.fn.stdpath("config") .. "/lua/store/telescopeTheme.txt"

local function save_theme_to_file(theme_label)
	local file = io.open(theme_file_path, "w")
	if file then
		file:write(theme_label)
		file:close()
	end
end

local function load_theme_from_file()
	local file = io.open(theme_file_path, "r")
	if file then
		local theme_label = file:read("*line")
		if theme_label then
			apply_theme(theme_label)
			print("Loaded theme: " .. theme_label)
		end
		file:close()
	end
end

local function apply_theme(theme_label)
	if theme_label == "Full transparency" then
		transparent()
	elseif theme_label == "Only titles colored" then
		titles()
	elseif theme_label == "All elements customized" then
		full()
	end

	save_theme_to_file(theme_label)
end

load_theme_from_file()

local themes = {
	{ label = "Full transparency" },
	{ label = "Only titles colored" },
	{ label = "All elements customized" },
}

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local function pick_theme()
	pickers
		.new({}, {
			prompt_title = "Choose Telescope Theme",
			finder = finders.new_table({
				results = vim.tbl_map(function(theme)
					return theme.label
				end, themes),
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(_, map)
				local function update_theme(prompt_bufnr)
					local selection = action_state.get_selected_entry().value
					if selection then
						apply_theme(selection)
						print("Selected theme: " .. selection)
					end
				end

				vim.schedule(function()
					local initial_selection = themes[1].label
					apply_theme(initial_selection)
					print("Selected theme applied: " .. initial_selection)
				end)

				map("i", "<Up>", function(prompt_bufnr)
					actions.move_selection_previous(prompt_bufnr)
					update_theme(prompt_bufnr)
				end)

				map("i", "<Down>", function(prompt_bufnr)
					actions.move_selection_next(prompt_bufnr)
					update_theme(prompt_bufnr)
				end)

				actions.select_default:replace(function(prompt_bufnr)
					local selection = action_state.get_selected_entry().value
					actions.close(prompt_bufnr)
					apply_theme(selection)
					print("Telescope theme " .. selection .. " applied")
				end)

				return true
			end,
		})
		:find()
end

vim.api.nvim_create_user_command(
	"PickTelescopeTheme",
	pick_theme,
	{ desc = "Pick between Telescope themes with real-time preview" }
)
