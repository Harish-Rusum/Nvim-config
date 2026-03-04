return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},

	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = { "pyright", "lua_ls", "clangd" },
		})
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)

				if client and client.server_capabilities.documentHighlightProvider then
					client.server_capabilities.documentHighlightProvider = false
				end
			end,
		})

		vim.diagnostic.config({
			severity_sort = true,
			update_in_insert = false,

			virtual_text = {
				prefix = "",
				spacing = 2,
				severity = { min = vim.diagnostic.severity.WARN },
			},

			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅙 ",
					[vim.diagnostic.severity.WARN]  = " ",
					[vim.diagnostic.severity.INFO]  = " ",
					[vim.diagnostic.severity.HINT]  = "󰌵 ",
				},
				severity = { min = vim.diagnostic.severity.WARN },
			},

			underline = {
				severity = { min = vim.diagnostic.severity.WARN },
			},
		})
		local servers = { "pyright", "lua_ls", "clangd" }

		for _, server in ipairs(servers) do
			local opts = {
				capabilities = capabilities,
			}

			if server == "lua_ls" then
				opts.settings = {
					Lua = {
						disable = { "trailing-space" },
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
						},
						format = {
							enable = false,
						}
					},
				}
			end
			vim.lsp.config(server, opts)
			vim.lsp.enable(server)
		end
	end,
}
