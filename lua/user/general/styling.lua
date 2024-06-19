-- PERF: Vim appearance settings

vim.cmd([[colorscheme catppuccin-mocha]])
vim.opt.fillchars = { eob = " " }
vim.opt.showmode = false
vim.opt.guicursor = "n-v-c:block,i:block"
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
  end
})
vim.api.nvim_create_autocmd("FileType", {
  group = IndentGroup,
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end
})
vim.api.nvim_create_autocmd("FileType", {
  group = IndentGroup,
  pattern = "cpp",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end
})
