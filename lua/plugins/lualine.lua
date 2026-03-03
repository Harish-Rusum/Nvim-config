local function recording()
  local reg = vim.fn.reg_recording()
  if reg == "" then
    return ""
  end
  return "󰑊 REC"
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {

		options = {
			theme = customcat,
			icons_enabled = true,
			component_separators = "",
			section_separators = "",
			globalstatus = true,
			refresh = {
				tabline = 100,
				statusline = 300,
				winbar = 300,
			},
		},
		sections = {

			lualine_a = {
				{
					"mode",
					separator = { left = "", right = "" },
					padding = { left = 1, right = 1 },
				},
			},
			lualine_b = {
				{ "branch", separator = { right = "" }, draw_empty = true },
			},
			lualine_c = {
				{ "diff", symbols = { added = " ", modified = " ", removed = " " } },
				"%=",
				"diagnostics",
			},

			lualine_x = {
				"filetype",
			},
			lualine_y = {
				{ "progress", separator = { left = "" } },
			},
			lualine_z = {
				{ "location", separator = { left = "", right = "" } },
			},
		},
		tabline = {

			lualine_a = {
				{ "searchcount", separator = { left = "", right = "" } },
				{
					recording,
					separator = { left = "", right = "" },
					color = { fg = "white", bg = "#FF746C" },
				},
			},

			lualine_b = {},
			lualine_c = { "selectioncount" },
			lualine_x = {},
			lualine_z = {
				{
					"buffers",
					fmt = function(str)
						return str:sub(1, 20)
					end,
					use_mode_colors = true,
					symbols = {
						modified = " ●",
						directory = " ",
						alternate_file = "",
					},
					separator = { left = "", right = "" },
					component_separators = { right = "" },
					section_separators = { left = "", right = "" },
				},
			},
		},
	},
}
