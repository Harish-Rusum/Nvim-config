-- NOTE: loading lazy.nvim.stuff
require("nvim.lazy")

-- NOTE: colorscheme
require("nvim.plugins.catppuccin")

-- NOTE: lsp (language-server-protocol) and autocomplete
require("nvim.lsp.lsp")
require("nvim.lsp.none-ls")
require("nvim.lsp.completions")
require("nvim.lsp.mason")
require("nvim.plugins.conform")
require("nvim.lsp.lines")

-- NOTE: search stuff
require("nvim.plugins.oil")
require("nvim.plugins.numb")

-- NOTE: git / github
require("nvim.git.gitsigns")
require("nvim.git.git")

-- NOTE: UI plugins (interface)
require("nvim.plugins.treesitter")
require("nvim.plugins.noice")

-- NOTE: terminal plugin
require("nvim.plugins.toggleterm")

-- NOTE: settings and styling
require("nvim.general.styling")
require("nvim.general.settings")

-- NOTE: Better lsp
require("nvim.lsp.lspsaga")

-- NOTE: Language running support
require("lang.cpp.run")

-- NOTE:  keymaps
require("nvim.general.keymaps")
