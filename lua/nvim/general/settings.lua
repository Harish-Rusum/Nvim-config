-- PERF: Vim settings

vim.cmd([[set guicursor=n-v-c:block,i:block]])
vim.cmd([[set nu]])
vim.cmd([[set rnu]])
vim.cmd([[bufdo LspStart]])
vim.cmd([[vnoremap > >gv]])
vim.cmd([[vnoremap < <gv]])

-- PERF: set relative line numbers only in normal mode or command mode
local set_relativenumber_group = vim.api.nvim_create_augroup("set_relativenumber", { clear = true })
local set_number_group = vim.api.nvim_create_augroup("set_number", { clear = true })

local function has_file_path()
	return vim.api.nvim_buf_get_name(0) ~= ""
end

vim.api.nvim_create_autocmd({ "VimEnter", "InsertLeave" }, {
	desc = "set relativenumber",
	group = set_relativenumber_group,
	pattern = "*",
	callback = function()
		if has_file_path() then
			vim.opt.relativenumber = true
		end
	end,
})
vim.api.nvim_create_autocmd("InsertEnter", {
	desc = "set number",
	group = set_number_group,
	pattern = "*",
	callback = function()
		if has_file_path() then
			vim.opt.relativenumber = false
			vim.opt.number = true
		end
	end,
})

vim.cmd([[set cursorline]])
vim.opt.undofile = true

vim.opt.undodir = vim.fn.expand("/home/linux/.config/nvim/undo")
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
