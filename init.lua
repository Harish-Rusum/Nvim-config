-- NOTE: loading lazy.nvim.stuff
require("nvim.lazy")

-- NOTE: lsp (language-server-protocol) and autocomplete
require("nvim.lsp.lsp")
require("nvim.lsp.none-ls")
require("nvim.lsp.lsnip")
require("nvim.lsp.completions")
require("nvim.lsp.mason")
require("nvim.plugins.conform")
-- require("nvim.lsp.lines")

-- NOTE: settings and styling
require("nvim.general.settings")
require("nvim.general.styling")

-- NOTE: UI plugins (interface)
require("nvim.plugins.which-key")
require("nvim.plugins.bufferline")
require("nvim.plugins.treesitter")
require("nvim.plugins.hicolors")
require("nvim.plugins.alpha")
require("nvim.plugins.noice")
require("nvim.plugins.lualine")

-- NOTE: search stuff
require("nvim.plugins.telescope")
require("nvim.plugins.oil")
require("nvim.plugins.neo-tree")
require("nvim.plugins.numb")

-- NOTE: git
require("nvim.plugins.gitsigns")
require("nvim.git.git")

-- NOTE: terminal plugin
require("nvim.plugins.toggleterm")
require("nvim.plugins.fterm")

-- NOTE:  keymaps for EVERYTHING
require("nvim.general.keymaps")
