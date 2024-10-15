local colors_catppuccin = {
	none = "none",
	blue = "#eabdbb",
	violet = "#b4befe",
	darkblue = "#2d3342",
	darkviolet = "#2d3342",
	lightgrey = "#6c7086",
	grey = "#6c7086",
	red = "#f38ba8",
	green = "#d291f1",
	white = "#dce0e8",
}

local colors_alt = {
	none = "none",
	blue = "#89b4fa",
	violet = "#b4befe",
	darkblue = "#1e1e3f",
	darkviolet = "#4c4f68",
	lightgrey = "#a6adc8",
	grey = "#585b70",
	red = "#f38ba8",
	green = "#a6e3a1",
	yellow = "#f9e2af",
	coral = "#fab387",
	white = "#dce0e8",
}

local theme_catppuccin = {
	normal = {
		a = { bg = colors_catppuccin.blue, fg = colors_catppuccin.darkblue, gui = "bold" },
		b = { bg = colors_catppuccin.darkviolet, fg = colors_catppuccin.white },
		c = { bg = colors_catppuccin.none, fg = colors_catppuccin.lightgrey },
	},
	insert = {
		a = { bg = colors_catppuccin.red, fg = colors_catppuccin.darkblue, gui = "bold" },
		b = { bg = colors_catppuccin.darkviolet, fg = colors_catppuccin.white },
		c = { bg = colors_catppuccin.none, fg = colors_catppuccin.lightgrey },
	},
}

local theme_alt = {
	normal = {
		a = { bg = colors_alt.blue, fg = colors_alt.darkblue, gui = "bold" },
		b = { bg = colors_alt.darkviolet, fg = colors_alt.white },
		c = { bg = colors_alt.none, fg = colors_alt.lightgrey },
	},
	insert = {
		a = { bg = colors_alt.red, fg = colors_alt.darkblue, gui = "bold" },
		b = { bg = colors_alt.darkviolet, fg = colors_alt.white },
		c = { bg = colors_alt.none, fg = colors_alt.lightgrey },
	},
}

local themes = {
	{ label = "Catppuccin", theme = theme_catppuccin },
	{ label = "Alternative", theme = theme_alt },
}

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

-- Function to save the selected theme to a file
local function save_theme_to_file(theme_label)
	local file = io.open(vim.fn.stdpath("config") .. "/lua/store/lualineTheme.txt", "w")
	if file then
		file:write(theme_label)
		file:close()
	end
end

-- Function to load the theme from the file
local function load_theme_from_file()
	local file = io.open(vim.fn.stdpath("config") .. "/lua/store/lualineTheme.txt", "r")
	if file then
		local theme_label = file:read("*all")
		file:close()
		for _, theme in pairs(themes) do
			if theme.label == theme_label then
				return theme.theme
			end
		end
	end
	return theme_catppuccin -- Default theme if no file or invalid data
end

-- Function to apply a Lualine theme
local function apply_lualine_theme(theme)
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = theme,
			globalstatus = true,
			component_separators = { left = "│", right = "│" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { statusline = {}, winbar = {} },
			always_divide_middle = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " ", hint = " " },
				},
			},
			lualine_c = { "" },
			lualine_x = {
				{
					"filetype",
					colored = false,
					icon_only = true,
					icon = { align = "right" },
					separator = "|",
				},
				{
					function()
						local clients = vim.lsp.buf_get_clients()
						local client_names = {}

						for _, client in pairs(clients) do
							if client.name ~= "null-ls" then
								table.insert(client_names, client.name)
							end
						end

						local sources = require("null-ls.sources").get_available(vim.bo.filetype)
						local unique_sources = {}

						for _, source in ipairs(sources) do
							if not unique_sources[source.name] then
								table.insert(client_names, source.name)
								unique_sources[source.name] = true
							end
						end

						return #client_names > 0 and "[" .. table.concat(client_names, ", ") .. "]" or ""
					end,
				},
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	})
end

-- Function to pick a Lualine theme
local function pick_lualine_theme()
	pickers
		.new({}, {
			prompt_title = "Choose Lualine Theme",
			finder = finders.new_table({
				results = vim.tbl_map(function(theme)
					return theme.label
				end, themes),
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(_, map)
				local function update_theme(prompt_bufnr)
					local selection = action_state.get_selected_entry().value
					local selected_theme = vim.tbl_filter(function(theme)
						return theme.label == selection
					end, themes)[1].theme
					apply_lualine_theme(selected_theme)
					save_theme_to_file(selection) -- Save the selected theme to a file
				end

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
					local selected_theme = vim.tbl_filter(function(theme)
						return theme.label == selection
					end, themes)[1].theme
					actions.close(prompt_bufnr)
					apply_lualine_theme(selected_theme)
					save_theme_to_file(selection) -- Save the selected theme to a file
					print("Lualine theme " .. selection .. " applied")
				end)

				return true
			end,
		})
		:find()
end

-- Apply the saved theme on startup
apply_lualine_theme(load_theme_from_file())

vim.api.nvim_create_user_command("PickLualineTheme", pick_lualine_theme, { desc = "Pick a Lualine theme" })
