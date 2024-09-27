-- NOTE: loading lazy.nvim stuff
require("lazy.lazy")

-- NOTE: lsp (language-server-protocol) and autocomplete
require("lsp.lsp")
require("lsp.none-ls")
require("lsp.luasnip")
require("lsp.completions")
require("lsp.mason")
require("plugins.conform")
-- require("lsp.lines")

-- NOTE: settings and styling
require("general.settings")
require("general.styling")

-- NOTE: UI plugins (interface)
require("plugins.which-key")
require("plugins.screenkey")
require("plugins.bufferline")
require("plugins.treesitter")
require("plugins.hicolors")
require("plugins.alpha")
require("plugins.noice")
require("plugins.lualine")

-- NOTE: search stuff
require("plugins.telescope")
require("plugins.oil")
require("plugins.neo-tree")
require("plugins.numb")

-- NOTE: git
require("plugins.gitsigns")
require("git.git")

-- NOTE: terminal plugin
require("plugins.toggleterm")

-- NOTE:  keymaps for EVERYTHING
require("general.keymaps")
