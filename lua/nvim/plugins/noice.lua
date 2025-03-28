-- PERF: setting up fancy caommand line and its colors

vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = "NONE", fg = "#FCFFC1" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { bg = "NONE", fg = "#FCFFC1" })
vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = "#FCFFC1" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = "#FCFFC1" })

require("noice").setup({
	cmdline = {
		enabled = true,
		view = "cmdline_popup",
		opts = {},
		format = {
			cmdline = { pattern = "^:", icon = "❯", lang = "vim" },
			search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
			filter = { pattern = "^:%s*!", icon = "", lang = "bash" },
			lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
			help = { pattern = "^:%s*he?l?p?%s+", icon = " " },
			input = { view = "cmdline_input", icon = "󰥻 " },
		},
	},
})

vim.defer_fn(function()
	vim.cmd([[set cmdheight=1]])
end, 100)

vim.defer_fn(function()
	vim.cmd[[Lspsaga winbar_toggle]]
end, 200)
