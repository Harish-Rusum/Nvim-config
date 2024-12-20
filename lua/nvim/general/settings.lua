-- PERF: Vim settings
vim.cmd([[set guicursor=n-v-c:block,i:block]])
vim.cmd([[set nu]])
vim.cmd([[bufdo LspStart]])
vim.cmd([[vnoremap > >gv]])
vim.cmd([[vnoremap < <gv]])
vim.cmd([[set splitright]])
vim.cmd([[set cursorline]])
vim.cmd([[IBLDisableScope]])
vim.cmd[[set nowrap]]
vim.opt.undofile = true
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
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

require("notify").setup({
	background_colour = "#000000",
})

vim.g.have_nerd_font = false
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.list = true
vim.opt.listchars = { tab = "▎ " }
-- vim.api.nvim_set_hl(0, 'Whitespace', { ctermfg = 240, guifg = '#5c6370' })
vim.cmd([[highlight Whitespace guifg=#303345 guibg=none]])
