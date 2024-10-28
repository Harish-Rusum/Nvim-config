-- styling.lua

-- PERF: Vim appearance settings
vim.api.nvim_create_augroup("nobg", { clear = true })
vim.cmd.colorscheme("catppuccin")
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

local function titles()
    local colors = require("catppuccin.palettes").get_palette("mocha")

    local function darken(color, percentage)
        local r = tonumber(color:sub(2, 3), 16)
        local g = tonumber(color:sub(4, 5), 16)
        local b = tonumber(color:sub(6, 7), 16)
        r = math.floor(r * (1 - percentage / 100))
        g = math.floor(g * (1 - percentage / 100))
        b = math.floor(b * (1 - percentage / 100))
        return string.format("#%02x%02x%02x", r, g, b)
    end

    local darken_percentage = 1

    local telescope_highlights = {
        TelescopePromptTitle = { bg = colors.red, fg = darken(colors.mantle, darken_percentage) },
        TelescopeResultsTitle = { fg = darken(colors.mantle, darken_percentage), bg = colors.green },
        TelescopePreviewTitle = { bg = colors.teal, fg = darken(colors.mantle, darken_percentage) },
        TelescopePromptPrefix = { bg = "none", fg = "#bec6e4", bold = true },
        TelescopePromptNormal = { bg = "none", fg = "#bec6e4", bold = true },
        TelescopeResultsNormal = { bg = "none", fg = "#bec6e4", bold = true },
        TelescopeResultsBorder = { bg = "none", fg = "#89b5fa" },
        TelescopePromptBorder = { bg = "none", fg = "#89b5fa" },
        TelescopePreviewNormal = { bg = "none", fg = "#89b5fa" },
        TelescopePreviewBorder = { bg = "none", fg = "#89b5fa" },
        TelescopeMatching = { bg = "none", fg = "#7a9ee0" },
        TelescopeSelection = { bg = "#26233a", fg = "#bec6e4", bold = true }
    }

    for hl, col in pairs(telescope_highlights) do
        vim.api.nvim_set_hl(0, hl, col)
    end
end

titles()
