-- PERF: setting up fancy caommand line and its colors
vim.api.nvim_set_hl(0, "NoiceCmdlinePopup",        { bg = "NONE", fg = "#FEFFE8" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { bg = "NONE", fg = "#FEFFE8" })
vim.api.nvim_set_hl(0, "NoiceCmdlineIcon",        { fg = "#FEFFE8" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle",  { fg = "#FEFFE8" })
--
-- require("noice").setup({
-- 	cmdline = {
-- 	opts = {
-- 		lsp = {
-- 			override = {
-- 				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
-- 				["vim.lsp.util.stylize_markdown"] = true,
-- 				["cmp.entry.get_documentation"] = true,
-- 			},
-- 		},
-- 		routes = {
-- 		},
-- 		presets = {
-- 			bottom_search = true,
-- 			command_palette = true,
-- 			long_message_to_split = true,
-- 		},
-- 	},
-- 		format = {
			-- cmdline = { pattern = "^:", icon = "❯", lang = "vim" },
			-- search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
			-- search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
			-- filter = { pattern = "^:%s*!", icon = "", lang = "bash" },
			-- lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
			-- help = { pattern = "^:%s*he?l?p?%s+", icon = " " },
			-- input = { view = "cmdline_input", icon = "󰥻 " },
-- 		},
-- 	},
-- })
vim.defer_fn(function()
	vim.cmd([[set cmdheight=0]])
end, 100)

vim.defer_fn(function()
	vim.cmd[[Lspsaga winbar_toggle]]
end, 200)
