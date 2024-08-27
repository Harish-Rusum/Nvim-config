-- PERF: installing formatters and linters for python,lua and c++

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.mypy.with({
			extra_args = { "--config-file", "/home/linux/.config/nvim/mypy.ini" },
		}),
		null_ls.builtins.formatting.clang_format,
	},
})
