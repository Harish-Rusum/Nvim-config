-- PERF: Vim appearance settings

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "catppuccin",
	callback = function()
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
			TelescopeNormal = { bg = darken(colors.mantle, darken_percentage), fg = colors.text },
			TelescopeBorder = {
				bg = darken(colors.mantle, darken_percentage),
				fg = darken(colors.mantle, darken_percentage),
			},
			TelescopePromptNormal = { bg = darken(colors.surface0, darken_percentage) },
			TelescopePromptBorder = {
				bg = darken(colors.surface0, darken_percentage),
				fg = darken(colors.surface0, darken_percentage),
			},
			TelescopePromptTitle = { bg = colors.red, fg = darken(colors.mantle, darken_percentage) },
			TelescopePromptPrefix = { bg = darken(colors.surface0, darken_percentage), fg = colors.red },
			TelescopeSelection = { bg = darken(colors.surface1, darken_percentage), fg = colors.text },
			TelescopeSelectionCaret = { bg = darken(colors.surface1, darken_percentage), fg = colors.red },
			TelescopeMatching = { fg = colors.blue },
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
	end,
})

vim.cmd.colorscheme("catppuccin")

vim.opt.fillchars = { eob = " " }
vim.opt.showmode = false
-- vim.opt.guicursor = "n-v-c:block,i:block"
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
vim.cmd([[
highlight NormalFloat guibg=none
highlight Normal guibg=none
]])

local IndentGroup = vim.api.nvim_create_augroup("CustomIndent", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = IndentGroup,
	pattern = "lua",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	group = IndentGroup,
	pattern = "python",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	group = IndentGroup,
	pattern = "cpp",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
	end,
})
