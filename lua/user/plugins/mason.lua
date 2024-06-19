-- PERF: setting up mason with rouded borders

require("mason").setup({
	ui = {
		border = "rounded",
	},
})

-- PERF: installing python,lua and c++ language servers

require("mason-lspconfig").setup({
	ensure_installed = {
		"pyright",
		"lua_ls",
		"clangd",
	},
})

-- PERF: setting up the language servers

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
lspconfig.pyright.setup({
	capabilities = capabilities,
})
lspconfig.lua_ls.setup({
	capabilities = capabilities,
})
lspconfig.clangd.setup({
	capabilities = capabilities,
})
