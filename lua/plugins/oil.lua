return {
  "stevearc/oil.nvim",
	config = function ()
		require("oil").setup({
			keymaps = {
				["q"] = "actions.close",
				["s"] = "actions.select_vsplit",
			},
		})
	end
}
