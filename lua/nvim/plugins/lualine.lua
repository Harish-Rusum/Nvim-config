-- PERF: defining theme colors with Catppuccin blue/violet tones
local colors = {
	none = "none",
	-- darkpurple = "none",
	darkpurple = "#232232",
	-- darkpurple = "#1f1f2c",
	-- darkpurple = "#1c1c28",
	skintone = "#eabdbb",
	darkblue = "#2d3342",
	darkviolet = "#2d3342",
	grey = "#6c7086",
	red = "#f38ba8",
	violet = "#d291f1",
	white = "#dce0e8",
}

-- PERF: Mapping the colors to lualine sections
local theme = {
	normal = {
		a = { bg = colors.skintone, fg = colors.darkblue, gui = "bold" },
		b = { bg = colors.darkviolet, fg = colors.white },
		c = { bg = colors.darkpurple, fg = colors.grey },
	},
	insert = {
		a = { bg = colors.red, fg = colors.darkblue, gui = "bold" },
		b = { bg = colors.darkviolet, fg = colors.white },
		c = { bg = colors.darkpurple, fg = colors.grey },
	},
	command = {
		a = { bg = colors.violet, fg = colors.darkblue, gui = "bold" },
		b = { bg = colors.darkviolet, fg = colors.white },
		c = { bg = colors.darkpurple, fg = colors.grey },
	},
	visual = {
		a = { bg = colors.red, fg = colors.darkblue, gui = "bold" },
		b = { bg = colors.darkviolet, fg = colors.white },
	},
	replace = {
		a = { bg = colors.red, fg = colors.darkblue, gui = "bold" },
		b = { bg = colors.darkviolet, fg = colors.white },
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

	-- PERF: Defining sections with diagnostic symbols and LSP/filetype color sync
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
				return " " .. (mode_map[current_mode] or current_mode:upper()) -- Default to uppercase if mode not found
			end,
		},

		lualine_b = {
			"branch",
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				diagnostics_color = {
					error = { fg = colors.red },
					warn = { fg = colors.violet },
					info = { fg = colors.skintone },
					hint = { fg = colors.violet },
				},
			},
		},
		lualine_c = {
			{
				"diff",
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
			}
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
