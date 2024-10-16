-- PERF: Vim appearance settings
vim.api.nvim_create_augroup("nobg", { clear = true })
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
-- 		vim.cmd([[
-- 		highlight NormalFloat guibg=none
-- 		highlight Normal guibg=none
-- 		]])
-- 	end,
-- })

vim.cmd.colorscheme("catppuccin")

vim.opt.showmode = false
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

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

require("notify").setup({
	background_colour = "#000000",
})
vim.cmd([[highlight WinSeparator guifg=#383646 guibg=none]])
