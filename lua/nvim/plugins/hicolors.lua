-- PERF: setting up a color preview plugin

require("nvim-highlight-colors").setup({
	render = "background",
	virtual_symbol = "■",
	virtual_symbol_prefix = "",
	virtual_symbol_suffix = " ",
	virtual_symbol_position = "inline",
	enable_hex = true,
	enable_short_hex = true,
	enable_rgb = true,
	enable_hsl = true,
	enable_var_usage = true,
	enable_named_colors = true,
	enable_tailwind = false,
	custom_colors = {
		{ label = "%-%-theme%-primary%-color",   color = "#0f1219" },
		{ label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
	},
	exclude_filetypes = {},
	exclude_buftypes = {},
})
