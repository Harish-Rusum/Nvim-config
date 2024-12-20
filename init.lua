-- NOTE: loading lazy.nvim.stuff
require("nvim.lazy")

-- NOTE: colorscheme
require("nvim.plugins.catppuccin")

-- NOTE: lsp (language-server-protocol) and autocomplete
require("nvim.lsp.lsp")
require("nvim.lsp.none-ls")
require("nvim.lsp.lsnip")
require("nvim.lsp.completions")
require("nvim.lsp.mason")
require("nvim.plugins.conform")
-- require("nvim.lsp.lines")

-- NOTE: UI plugins (interface)
require("nvim.plugins.which-key")
require("nvim.plugins.treesitter")
require("nvim.plugins.hicolors")
require("nvim.plugins.alpha")
require("nvim.plugins.noice")
require("nvim.plugins.lualine")
require("nvim.plugins.bqf")
require("nvim.plugins.bufferline")

-- NOTE: search stuff
require("nvim.plugins.telescope")
require("nvim.plugins.neo-tree")
require("nvim.plugins.numb")

-- NOTE: git / github
require("nvim.git.gitsigns")
require("nvim.git.git")

-- NOTE: terminal plugin
require("nvim.plugins.toggleterm")

-- NOTE: settings and styling
require("nvim.general.styling")
require("nvim.general.settings")

-- NOTE: Language specific stuff
require("lang.py.run")
require("lang.cpp.run")

-- NOTE:  keymaps
require("nvim.general.keymaps")
