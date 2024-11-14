-- PERF: setting up gitsigns (to show changes in a git file)

require('gitsigns').setup {
	signs = {
		add          = { text = '┃' },
		change       = { text = '󱕖' },
		delete       = { text = '󰍵' },
		topdelete    = { text = '󰍵' },
		changedelete = { text = '󱕖' },
	},
}
