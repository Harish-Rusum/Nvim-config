require("which-key").register {
	["<leader>t"] = {name = "Telescope/Terminal",_ = "which_key_ignore"},
	["<leader>b"] = {name = "Buffer",_ = "which_key_ignore"},
	["<leader>c"] = {name = "Code",_ = "which_key_ignore"},
	["<leader>z"] = {name = "ZenMode",_ = "which_key_ignore"},
	["<leader>h"] = {name = "Harpoon",_ = "which_key_ignore"},
	["<leader>f"] = {name = "Fold",_ = "which_key_ignore"},
}

require("which-key").setup {
    window = {
        border = "rounded", -- Options: "none", "single", "double", "rounded", "solid", "shadow"
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    -- other options
}
