-- styling.lua

-- PERF: Vim appearance settings
vim.api.nvim_create_augroup("nobg", { clear = true })
vim.cmd.colorscheme("vscode")
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
    desc = "highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local normal_bg = vim.api.nvim_get_hl_by_name("Normal", true).background
    vim.cmd(string.format("highlight! WhichKeyFloatBorder guibg=#%06x", normal_bg))
    vim.cmd(string.format("highlight! WhichKeyBorder guibg=#%06x", normal_bg))
    vim.cmd(string.format("highlight! WhichKey guibg=#%06x", normal_bg))
    vim.cmd(string.format("highlight! WhichKeyFloat guibg=#%06x", normal_bg))
  end,
})
