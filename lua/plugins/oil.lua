-- PERF: defining oil (file explorer) keymaps

require("oil").setup({
	keymaps = {
		["q"] = "actions.close",
		["s"] = "actions.select_vsplit",
	},
})
