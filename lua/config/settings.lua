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
vim.g.mapleader = " "
vim.g.maplocalleader = " "
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
vim.cmd([[IBLDisableScope]])
vim.cmd([[Lspsaga winbar_toggle]])
-- vim.api.nvim_set_hl(0, 'Whitespace', { ctermfg = 240, guifg = '#5c6370' })
vim.cmd([[highlight Whitespace guifg=#303345 guibg=none]])
-- vim.cmd([[Copilot enable]])

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
