local cmp = require("cmp")

-- PERF: setting up the completion engine

cmp.setup({
	-- PERF: defining engine for snippets

	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	-- -PERF: setting up the window to be borderd

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	-- PERF: setting up keymaps for completion

	mapping = cmp.mapping.preset.insert({
		["<Escape>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	-- PERF: setting up completion sources

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = 'luasnip' },
	},
	{
		{ name = "buffer" },
	}),
})
