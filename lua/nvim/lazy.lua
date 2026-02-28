-- ------------------------------------------------------------------------ --
--                             CUSTOM FUNCTIONS                             --
-- ------------------------------------------------------------------------ --

-- Recording Status
local function recording()
	local reg = vim.fn.reg_recording()
	if reg == "" then
		return ""
	end -- not recording
	return "󰑊 REC"
end

-- PERF: setting up lazypath
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.keymap.set("n", "<leader>bn", function()
	vim.cmd([[bnext]])
end)
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- PERF: loadig in plugins
local plugins = {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "folke/tokyonight.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "shaunsingh/nord.nvim" },
	{ "AlexvZyl/nordic.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "LunarVim/Colorschemes" },
	{ "RRethy/base16-nvim" },

	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {

			options = {
				theme = customcat,
				icons_enabled = true,
				component_separators = "",
				section_separators = "",
				globalstatus = true,
				refresh = {
					tabline = 100,
					statusline = 300,
					winbar = 300,
				},
			},
			sections = {

				lualine_a = {
					{
						"mode",
						separator = { left = "", right = "" },
						padding = { left = 1, right = 1 },
					},
				},
				lualine_b = {
					{ "branch", separator = { right = "" }, draw_empty = true },
				},
				lualine_c = {
					{ "diff", symbols = { added = " ", modified = " ", removed = " " } },
					"%=",
					"diagnostics",
				},

				lualine_x = {
					"filetype",
				},
				lualine_y = {
					{ "progress", separator = { left = "" } },
				},
				lualine_z = {
					{ "location", separator = { left = "", right = "" } },
				},
			},
			tabline = {

				lualine_a = {
					{ "searchcount", separator = { left = "", right = "" } },
					{
						recording,
						separator = { left = "", right = "" },
						color = { fg = "white", bg = "#FF746C" },
					},
				},

				lualine_b = {},
				lualine_c = { "selectioncount" },
				lualine_x = {},
				lualine_z = {
					{
						"buffers",
						fmt = function(str)
							return str:sub(1, 20)
						end,
						use_mode_colors = true,
						symbols = {
							modified = " ●",
							directory = " ",
							alternate_file = "",
						},
						separator = { left = "", right = "" },
						component_separators = { right = "" },
						section_separators = { left = "", right = "" },
					},
				},
			},
		},
	},

	{ "stevearc/oil.nvim" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "nvimtools/none-ls.nvim" },
	{
		"hrsh7th/nvim-cmp",
	},
	{ "github/copilot.vim" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "williamboman/mason.nvim" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "folke/trouble.nvim", opts = {}, cmd = "Trouble" },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "stevearc/dressing.nvim" },
	{ "lewis6991/gitsigns.nvim" },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
				warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
				info = { "DiagnosticInfo", "#F53B6D" },
				hint = { "DiagnosticHint", "#10B981" },
				default = { "Identifier", "#7C3AED" },
				test = { "Identifier", "#FF00FF" },
			},
		},
	},
	{ "nacro90/numb.nvim" },
	{ "numToStr/Comment.nvim", opts = {}, lazy = false },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "tpope/vim-fugitive" },
	{ "brenoprata10/nvim-highlight-colors" },
	{ "rcarriga/nvim-notify" },
	{ "MunifTanjim/nui.nvim", event = "VimEnter" },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{ "stevearc/conform.nvim", opts = {} },
	{ "j-hui/fidget.nvim", opts = {} },
	-- { "goolord/alpha-nvim", dependencies = { "echasnovski/mini.icons" } },
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {
      file = {
        [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
        ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
      },
      filetype = {
        dotenv = { glyph = "", hl = "MiniIconsYellow" },
      },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
	{ "tpope/vim-surround" },
	{
		"Wansmer/treesj",
		keys = { "<space>m" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({ max_join_length = 1000 })
		end,
	},
	{
			"folke/noice.nvim",
			event = "VeryLazy",
			opts = {
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				routes = {
				},
				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
				},
			},
		},
		{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
		{ "ThePrimeagen/vim-be-good" },
		{ "rose-pine/neovim", name = "rose-pine" },
		{
			"nvimdev/lspsaga.nvim",
			config = function()
				require("lspsaga").setup({
					breadcrumbs = {
						enabled = false,
					},
					lightbulb = {
						enable = false,
					},
					code_action = "",
					diagnostic = {
						jump_num = false,
					},
				})
			end,
		},
		{ "arkav/lualine-lsp-progress" },
		{
			"kylechui/nvim-surround",
			version = "*",
			event = "VeryLazy",
			config = function()
				require("nvim-surround").setup({})
			end,
		},
		{ "eandrju/cellular-automaton.nvim" },
		{ "mistricky/codesnap.nvim", build = "make" },
		{
			"echasnovski/mini.ai",
		},
		{
			"stevearc/oil.nvim",
			opts = {},
			dependencies = { { "echasnovski/mini.icons", opts = {} } },
		},
		{
			"christoomey/vim-tmux-navigator",
		},

		{
			"folke/snacks.nvim",
			priority = 1000,
			lazy = false,
			opts = {
				bigfile = { enabled = true },
				scratch = { enabled = true },
				dashboard = {
					preset = {
						pick = function(cmd, opts)
							return LazyVim.pick(cmd, opts)()
						end,
						-- header = [[
						--      ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
						--      ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
						--      ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
						--      ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
						--      ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
						--      ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
						--      ]],
						header = [[                           
  ▄▄         ▄ ▄▄▄▄▄▄▄    
▄▀███▄     ▄██ █████▀     
██▄▀███▄   ███            
███  ▀███▄ ███            
███    ▀██ ███            
███      ▀ ███            
▀██ █████▄▀█▀▄██████▄     
  ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀    
         eovim           
                         ]],
						---@type snacks.dashboard.Item[]
						keys = {
							{
								icon = " ",
								key = "f",
								desc = "Find File",
								action = ":lua Snacks.dashboard.pick('files')",
							},
							{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
							{
								icon = " ",
								key = "g",
								desc = "Find Text",
								action = ":lua Snacks.dashboard.pick('live_grep')",
							},
							{
								icon = " ",
								key = "r",
								desc = "Recent Files",
								action = ":lua Snacks.dashboard.pick('oldfiles')",
							},
							{
								icon = " ",
								key = "c",
								desc = "Config",
								action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
							},
							{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
							{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
							{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
						},
					},
				},
				explorer = { enabled = true },
				indent = { enabled = false },
				input = { enabled = false },
				notifier = { enabled = true },
				notify = { enabled = true },
				picker = { enabled = true },
				quickfile = { enabled = false },
				scope = { enabled = false },
				scroll = { enabled = false },
				statuscolumn = { enabled = false },
				words = { enabled = false },
				styles = {
					notification = {},
				},
			},
		},
	}
	-- PERF: setting a rounded border

	local opts = {
		ui = {
			border = "rounded",
		},
	}
	require("lazy").setup(plugins, opts)
