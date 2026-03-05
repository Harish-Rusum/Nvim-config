local opt = vim.opt
local g = vim.g

-- opt.guicursor = "n-v-c:block,i:block"

vim.opt.guicursor =
  "n-v-c-sm:block," ..
  "i-ci-ve:ver100," ..
  "r-cr-o:hor20"

opt.number = true
opt.relativenumber = true
opt.splitright = true
opt.splitbelow = true
opt.wrap = false
opt.showcmd = true
opt.smartcase = true
opt.ignorecase = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300
opt.inccommand = "split"
opt.scrolloff = 10
opt.showmode = false
opt.cmdheight = 0
opt.inccommand = "split"
opt.list = true
opt.listchars = { tab = "▎ ", trail = "·", nbsp = "␣" }
opt.undofile = true
opt.cursorline = true

g.mapleader = " "
g.maplocalleader = " "
g.have_nerd_font = true

local number_group = vim.api.nvim_create_augroup("NumberToggle", { clear = true })

local function has_file()
  return vim.api.nvim_buf_get_name(0) ~= ""
end

vim.api.nvim_create_autocmd({ "VimEnter", "InsertLeave" }, {
  group = number_group,
  callback = function()
    if has_file() then
      opt.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = number_group,
  callback = function()
    if has_file() then
      opt.relativenumber = false
      opt.number = true
    end
  end,
})

local indent_group = vim.api.nvim_create_augroup("CustomIndent", { clear = true })

local function set_indent(ft, shift, tab)
  vim.api.nvim_create_autocmd("FileType", {
    group = indent_group,
    pattern = ft,
    callback = function()
      vim.opt_local.shiftwidth = shift
      vim.opt_local.tabstop = tab
    end,
  })
end

set_indent("lua", 2, 2)
set_indent("python", 4, 4)
set_indent("cpp", 4, 4)

vim.cmd("Copilot disable")

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local signs = {
  Error = "󰅙 ",
  Warn  = " ",
  Info  = " ",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "",
    spacing = 2,
    severity = { min = vim.diagnostic.severity.WARN },
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
