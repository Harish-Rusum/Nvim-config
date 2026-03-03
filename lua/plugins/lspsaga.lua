return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			breadcrumbs = {
				enabled = false,
			},
			lightbulb = {
				enable = false,
			},
			code_action = "",
			diagnostic = {
				jump_num = false,
			},
		})
	end,
}
