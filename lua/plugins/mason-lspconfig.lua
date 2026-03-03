return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = { "pyright", "lua_ls", "clangd" },
		})
	end,
}
