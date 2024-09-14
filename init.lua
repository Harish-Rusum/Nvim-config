-- NOTE: loading lazy.nvim stuff
require("user.lazy.lazy")

-- NOTE: lsp (language-server-protocol) and autocomplete
require("user.lsp.lsp")
require("user.lsp.none-ls")
require("user.lsp.luasnip")
require("user.lsp.completions")

-- NOTE: settings and styling of nvim
require("user.general.settings")
require("user.general.styling")

-- NOTE: UI plugins (user-interface)
require("user.plugins.lualine")
require("user.plugins.which-key")
require("user.plugins.screenkey")
require("user.plugins.bufferline")
require("user.plugins.gitsigns")
require("user.plugins.treesitter")
require("user.plugins.hicolors")
require("user.plugins.noice")

-- NOTE: search stuff
require("user.plugins.telescope")
require("user.plugins.oil")
require("user.plugins.neo-tree")
require("user.plugins.numb")

-- NOTE: markdown
require("user.plugins.scrollbar")

-- NOTE: terminal plugin
require("user.plugins.fterm")
require("user.plugins.toggleterm")

-- NOTE: mason for installing dependencies
require("user.plugins.mason")

-- NOTE: plugin for persisting nvim sessions
require("user.plugins.auto-session")

-- NOTE: remainder system
require("user.popups.remainder")

-- NOTE : keymaps for EVERYTHING
require("user.general.keymaps")
