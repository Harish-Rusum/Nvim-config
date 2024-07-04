-- NOTE: loading lazy.nvim stuff
require("user.lazy")

-- NOTE: lsp (language-server-protocol) things
require("user.general.lsp")
require("user.plugins.none-ls")

-- NOTE: completion stuff
require("user.plugins.luasnip")
require("user.plugins.completions")

-- NOTE: settings and styling of nvim
require("user.general.settings")
require("user.general.styling")

-- NOTE: UI plugins (user-interface)
require("user.plugins.lualine")
require("user.plugins.which-key")
require("user.plugins.screenkey")
require("user.plugins.winbar")
require("user.plugins.bufferline")
require("user.plugins.gitsigns")
require("user.plugins.treesitter")
require("user.plugins.hicolors")



-- NOTE: search stuff
require("user.plugins.telescope")
require("user.plugins.oil")
require("user.plugins.numb")

-- NOTE: terminal plugin
require("user.plugins.toggleterm")

-- NOTE: mason for installing dependencies
require("user.plugins.mason")

-- NOTE: plugin persisting nvim sessions
require("user.plugins.auto-session")

-- NOTE: remainder system
require("user.popups.remainder")

-- NOTE : keymaps for EVERYTHING
require("user.general.keymaps")
