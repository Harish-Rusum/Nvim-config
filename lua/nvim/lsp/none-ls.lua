-- PERF: installing formatters and linters for python,lua and c++

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.clang_format,
	},
})
