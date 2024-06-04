require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"pyright",
		"lua_ls",
		"clangd",
	}
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
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
