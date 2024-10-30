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
require("nvim.plugins.bufferline")
require("nvim.plugins.treesitter")
require("nvim.plugins.hicolors")
require("nvim.plugins.alpha")
require("nvim.plugins.harpoon")
require("nvim.plugins.noice")
require("nvim.plugins.lualine")
require("nvim.plugins.bqf")
require("nvim.plugins.codesnap")

-- NOTE: search stuff
require("nvim.plugins.telescope")
require("nvim.plugins.oil")
require("nvim.plugins.neo-tree")
require("nvim.plugins.numb")
require("nvim.plugins.harpoon")

-- NOTE: git / github
require("nvim.git.gitsigns")
require("nvim.git.git")
require("nvim.git.octohub")

-- NOTE: terminal plugin
require("nvim.plugins.toggleterm")
require("nvim.plugins.fterm")

-- NOTE: settings and styling
require("nvim.general.styling")
require("nvim.general.settings")

-- NOTE: Language specific stuff
require("lang.py.run")
require("lang.cpp.run")

-- NOTE:  keymaps
require("nvim.general.keymaps")
