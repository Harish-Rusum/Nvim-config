-- PERF: Vim settings
vim.opt.guicursor = "n-v-c:block,i:block"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.showcmd = true
vim.g.have_nerd_font = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.scrolloff = 10
vim.opt.list = true
vim.opt.listchars = { tab = "▎ " }
vim.opt.undofile = true

-- PERF: set relative line numbers only in normal mode or command mode
local set_relativenumber_group = vim.api.nvim_create_augroup("set_relativenumber", {})
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

local IndentGroup = vim.api.nvim_create_augroup("CustomIndent", { clear = true })

local function setIndent(filetype, shiftwidth, tabstop)
	vim.api.nvim_create_autocmd("FileType", {
		group = IndentGroup,
		pattern = filetype,
		callback = function()
			vim.opt_local.shiftwidth = shiftwidth
			vim.opt_local.tabstop = tabstop
		end,
	})
end

setIndent("lua", 2, 2)
setIndent("python", 4, 4)
setIndent("cpp", 4, 4)

vim.cmd([[bufdo LspStart]])
-- vim.cmd([[IBLDisableScope]])
vim.cmd([[Lspsaga winbar_toggle]])
-- vim.api.nvim_set_hl(0, 'Whitespace', { ctermfg = 240, guifg = '#5c6370' })
vim.cmd([[highlight Whitespace guifg=#303345 guibg=none]])
