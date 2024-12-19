-- PERF: Defining theme colors with Catppuccin blue/violet tones
local colors = {
	none = "none",
	blue = "#0089d0",
	grey = "#dce0e8",
	white = "#dce0e8",
	violet = "#0089d0",
}

-- PERF: Mapping the colors to lualine sections
local theme = {
	normal = {
		a = { bg = colors.blue, fg = colors.grey, gui = "bold" },
		b = { bg = colors.violet, fg = colors.white },
		c = { bg = colors.blue, fg = colors.grey },
	},
	insert = {
		a = { bg = colors.violet, fg = colors.grey, gui = "bold" },
		b = { bg = colors.violet, fg = colors.white },
		c = { bg = colors.blue, fg = colors.grey },
	},
	command = {
		a = { bg = colors.blue, fg = colors.grey, gui = "bold" },
		b = { bg = colors.violet, fg = colors.white },
		c = { bg = colors.blue, fg = colors.grey },
	},
	visual = {
		a = { bg = colors.violet, fg = colors.grey, gui = "bold" },
		b = { bg = colors.violet, fg = colors.white },
	},
	replace = {
		a = { bg = colors.violet, fg = colors.grey, gui = "bold" },
		b = { bg = colors.violet, fg = colors.white },
		c = { bg = colors.none, fg = colors.grey },
	},
}

-- PERF: Actually setting up lualine (the statusbar)
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = theme,
		globalstatus = true,
		component_separators = { left = "/", right = "│" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { statusline = {}, winbar = {} },
		always_divide_middle = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},

	sections = {
		lualine_a = {
			function()
				local mode_map = {
					n = "NORMAL",
					i = "INSERT",
					v = "VISUAL",
					V = "V-LINE",
					c = "COMMAND",
					t = "TERMINAL",
					R = "REPLACE",
				}
				local current_mode = vim.fn.mode()
				return " " .. (mode_map[current_mode] or current_mode:upper())
			end,
		},

		lualine_b = {
			"branch",
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				diagnostics_color = {
					error = { fg = colors.white },
					warn = { fg = colors.white },
					info = { fg = colors.white },
					hint = { fg = colors.white },
				},
			},
		},
		lualine_c = {
		},
		lualine_d = { "" },
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

					return #client_names > 0 and "[" .. table.concat(client_names, ", ") .. "]" or ""
				end,
				color = { fg = colors.grey, gui = "bold" },
			},
		},
		lualine_y = {
			{
				function()
					return "󰉋 " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				end,
				color = { fg = colors.grey },
			},
		},
		lualine_z = { "location" },
	},
})
