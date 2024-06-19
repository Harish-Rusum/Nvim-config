-- PERF: Vim settings

vim.cmd([[set nu]])
vim.cmd([[set rnu]])
vim.cmd([[bufdo LspStart]])
vim.cmd([[command! -nargs=1 G execute ':!git <args>']])
vim.g.clipboard = {
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf",
	},
}
-- PERF: set relative line numbers only in normal mode or command mode

vim.opt.undofile = true
local set_relativenumber_group = vim.api.nvim_create_augroup("set_relativenumber", { clear = true })
vim.api.nvim_create_autocmd({"VimEnter", "InsertLeave"}, {
  desc = "set relativenumber",
  group = set_relativenumber_group,
  pattern = "*",
  command = "set relativenumber"
})
local set_number_group = vim.api.nvim_create_augroup("set_number", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
  desc = "set number",
  group = set_number_group,
  pattern = "*",
  command = "set number norelativenumber"
})
