-- PERF: catppuccin theme settings

require("catppuccin").setup({
    flavour = "mocha",
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    show_end_of_buffer = false,
})

vim.cmd.colorscheme "catppuccin"
