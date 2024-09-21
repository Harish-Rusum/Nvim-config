-- PERF: defining theme colors with Catppuccin blue/violet tones
local colors = {
	none = "none",
	-- none = "#1e2031",
	blue = "#8aadf5",
	violet = "#b4befe",
	darkblue = "#2d3342",
	darkviolet = "#2d3342",
	lightgrey = "#6c7086",
	grey = "#6c7086",
	red = "#f38ba8",
	green = "#95d982",
	white = "#dce0e8",
}

-- PERF: Mapping the colors to lualine sections, emphasizing Catppuccin's balance and style
local theme = {
	normal = {
		a = { bg = colors.blue, fg = colors.darkblue, gui = "bold" },
		b = { bg = colors.darkviolet, fg = colors.white },
		c = { bg = colors.none, fg = colors.lightgrey },
	},
	insert = {
		a = { bg = colors.green, fg = colors.darkblue, gui = "bold" },
		b = { bg = colors.darkviolet, fg = colors.white },
		c = { bg = colors.none, fg = colors.lightgrey },
	},
	command = {
		a = { bg = colors.green, fg = colors.darkblue, gui = "bold" },
		b = { bg = colors.darkviolet, fg = colors.white },
		c = { bg = colors.none, fg = colors.lightgrey },
	},
	visual = {
		a = { bg = colors.red, fg = colors.darkblue, gui = "bold" },
		b = { bg = colors.darkviolet, fg = colors.white },
		c = { bg = colors.none, fg = colors.lightgrey },
	},
	replace = {
		a = { bg = colors.red, fg = colors.darkblue, gui = "bold" },
		b = { bg = colors.darkviolet, fg = colors.white },
		c = { bg = colors.none, fg = colors.lightgrey },
	},
}

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = theme,
		globalstatus = true,
		component_separators = { left = "│", right = "│" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { statusline = {}, winbar = {} },
		always_divide_middle = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},

	-- PERF: Defining sections with diagnostic symbols and LSP/filetype color sync
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				diagnostics_color = {
					error = { fg = colors.red },
					warn = { fg = colors.violet },
					info = { fg = colors.blue },
					hint = { fg = colors.green },
				},
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
				color = { fg = colors.grey, gui = "bold" },
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

					-- return #client_names > 0 and "  [" .. table.concat(client_names, ", ") .. "]" or ""
					return #client_names > 0 and "[" .. table.concat(client_names, ", ") .. "]" or ""
				end,
				color = { fg = colors.grey, gui = "bold" },
			},
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

