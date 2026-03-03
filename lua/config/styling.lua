-- styling.lua

-- PERF: Vim appearance settings
vim.api.nvim_create_augroup("nobg", { clear = true })
vim.cmd.colorscheme("tokyonight-night")
vim.cmd([[highlight Visual guibg=#2f2f3f guifg=none]])
vim.opt.showmode = false

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "NONE" })
    end,
})

-- Highlighting for buffer line components
local bufferline_highlights = {
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineSeparatorVisible",
    "BufferLineSeparatorSelected",
    "BufferLineCloseButton",
    "BufferLineCloseButtonVisible",
    "BufferLineCloseButtonSelected",
    "BufferLineBufferVisible",
    "BufferLineBufferSelected",
    "BufferLineFill",
    "BufferLineDiagnostic"
}

for _, hl in ipairs(bufferline_highlights) do
    vim.api.nvim_set_hl(0, hl, { bg = "NONE" })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})


local signs = { Error = "󰅙 " , Warn = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- Enable virtual text (inline) and signs (gutter)
vim.diagnostic.config({
    virtual_text = {
        prefix = "", -- can be any symbol, e.g., "●", "■"
        spacing = 2,
        severity = { min = vim.diagnostic.severity.WARN }, -- show only WARN+ errors
    },
    signs = true,  -- show signs in the gutter
    underline = true, -- underline text with errors
    update_in_insert = false, -- don't update diagnostics while typing
    severity_sort = true, -- sort by severity
})
