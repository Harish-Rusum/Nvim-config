return {
	"Wansmer/treesj",
	keys = {
		{
			"<leader>m",
			function() require("treesj").toggle() end,
			desc = "Toggle split/join (treesj)",
		},
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("treesj").setup({ max_join_length = 1000 })
	end,
}
