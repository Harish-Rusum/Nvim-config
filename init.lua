-- NOTE: loading lazy.nvim stuff
require("lazy.lazy")

-- NOTE: lsp (language-server-protocol) and autocomplete
require("lsp.lsp")
require("lsp.none-ls")
require("lsp.luasnip")
require("lsp.completions")

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
require("plugins.smoothcursor")

-- NOTE: search stuff
require("plugins.telescope")
require("plugins.oil")
require("plugins.neo-tree")
require("plugins.numb")

-- NOTE: Lualine (other option is lualine_sharp)
require("lualine.lualine_rounded")

-- NOTE: git commands
require("plugins.gitsigns")
require("git.git")

-- NOTE: terminal plugin
require("plugins.fterm")
require("plugins.toggleterm")

-- NOTE: mason for installing dependencies
require("plugins.mason")

-- NOTE:  keymaps for EVERYTHING
require("general.keymaps")
