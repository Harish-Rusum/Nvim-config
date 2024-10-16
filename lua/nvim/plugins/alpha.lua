-- PERF: setting up the nvim dashboard

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	-- [[                                   ]],
	-- [[                                   ]],
	-- [[                                   ]],
	-- [[ ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ]],
	-- [[ ████╗  ██║██║   ██║██║████╗ ████║ ]],
	-- [[ ██╔██╗ ██║██║   ██║██║██╔████╔██║ ]],
	-- [[ ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
	-- [[ ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
	-- [[ ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
	-- [[                                   ]],
	-- [[                                   ]],
	-- [[                                                                       ]],
	-- [[                                                                       ]],
	-- [[                                                                       ]],
	-- [[                                                                       ]],
	-- [[                                                                     ]],
	-- [[       ████ ██████           █████      ██                     ]],
	-- [[      ███████████             █████                             ]],
	-- [[      █████████ ███████████████████ ███   ███████████   ]],
	-- [[     █████████  ███    █████████████ █████ ██████████████   ]],
	-- [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	-- [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	-- [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	-- [[                                                                       ]],
	-- [[                                                                       ]],
	-- [[                                                                       ]],
	-- [[                                   ]],
	[[                            ]],
	[[     ▄▄         ▄ ▄▄▄▄▄▄▄   ]],
	[[   ▄▀███▄     ▄██ █████▀    ]],
	[[   ██▄▀███▄   ███           ]],
	[[   ███  ▀███▄ ███           ]],
	[[   ███    ▀██ ███           ]],
	[[   ███      ▀ ███           ]],
	[[   ▀██ █████▄▀█▀▄██████▄    ]],
	[[     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ]],
	[[            eovim          ]],
	[[                            ]],
}

dashboard.section.buttons.val = {
	dashboard.button("n", "  New file", ":ene <CR>"),
	dashboard.button("e", "  File explorer", ":Oil<CR>"),
	dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
	dashboard.button("c", "  Config", ":e $MYVIMRC | pwd<CR>"),
	dashboard.button("g", "󰈞  Grep", ":Telescope live_grep<CR>"),
	dashboard.button("q", "  Quit", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#ff79c6", bold = true })
vim.api.nvim_set_hl(0, "AlphaButton", { fg = "#50fa7b", bold = true })
vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#bd93f9", bold = true })
vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#f1fa8c", italic = true })
