-- PERF: ToggleTerm (terminal) plugin

require("toggleterm").setup({
    direction = 'float',
    float_opts = {
        border = 'rounded',
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
  highlights = {
    Normal = {
      guibg = "none",
      guifg = "none",
    },
    NormalFloat = {
      guibg = 'none',
      guifg = 'none',
    },
	},
	shade_terminal = false,
	shading_factor = 0,
	shell = vim.o.shell,
})

