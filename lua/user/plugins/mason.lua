require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"pyright",
		"lua_ls",
	}
})
local lspconfig = require("lspconfig")
lspconfig.pyright.setup({})
lspconfig.lua_ls.setup({})
