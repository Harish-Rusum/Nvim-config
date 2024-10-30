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
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{ "nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "stevearc/oil.nvim" },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "nvimtools/none-ls.nvim" },
	{ "L3MON4D3/LuaSnip" },
	{
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-ghost-text",
		},
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "williamboman/mason.nvim" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },
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
	{ "L3MON4D3/LuaSnip" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "RRethy/vim-illuminate" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "tpope/vim-repeat" },
	{"tpope/vim-fugitive"},
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
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{ "gen740/SmoothCursor.nvim" },
	{ "stevearc/conform.nvim", opts = {} },
	{ "j-hui/fidget.nvim", opts = {} },
	{ "goolord/alpha-nvim", dependencies = { "echasnovski/mini.icons" } },
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
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
	{ "numToStr/FTerm.nvim" },
	{ "ThePrimeagen/vim-be-good" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		'nvimdev/lspsaga.nvim',
		config = function()
			require("lspsaga").setup({
				breadcrumbs = {
					enabled = false,
				},
				lightbulb = {
					enable = false,
				},
				code_action = '',
				diagnostic = {
					jump_num = false,
				},
			})
		end,
	},
	{'arkav/lualine-lsp-progress'},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
			})
		end
	},
	{
		"karb94/neoscroll.nvim",
		config = function ()
			require('neoscroll').setup({})
		end
	},
	{'kevinhwang91/nvim-bqf'},
	{"eandrju/cellular-automaton.nvim"},
	{
		'2kabhishek/octohub.nvim',
		cmd = {
			'OctoRepos',
			'OctoRepo',
			'OctoStats',
			'OctoActivityStats',
			'OctoContributionStats',
			'OctoRepoStats',
			'OctoProfile',
			'OctoRepoWeb',
		},
		keys = {
			'<leader>goa',
			'<leader>goc',
			'<leader>gof',
			'<leader>gog',
			'<leader>goh',
			'<leader>goi',
			'<leader>goo',
			'<leader>gop',
			'<leader>gor',
			'<leader>gos',
			'<leader>got',
			'<leader>gou',
			'<leader>gow',
		},
		dependencies = {
			'2kabhishek/utils.nvim',
			'nvim-telescope/telescope.nvim'
		},
		opts = {},
	},
	{ "mistricky/codesnap.nvim", build = "make" },
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	},
}
-- PERF: setting a rounded border

local opts = {
	ui = {
		border = "rounded",
	},
}
require("lazy").setup(plugins, opts)
