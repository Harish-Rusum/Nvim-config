-- PERF: setting up lazypath

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.keymap.set("n", "<leader>bn", ":bnext")
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
	{ "tribela/vim-transparent" },
	{ "catppuccin/nvim",        name = "catppuccin", priority = 1000 },
	{ "tpope/vim-surround" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
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
	{
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "L3MON4D3/LuaSnip" },
		},
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{
		"williamboman/mason.nvim",
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
	},
	{ "nvimtools/none-ls.nvim" },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "stevearc/dressing.nvim" },
	{ "lewis6991/gitsigns.nvim" },
	{ "ellisonleao/glow.nvim",   config = true, cmd = "Glow" },
	{ "ThePrimeagen/harpoon" },
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
	{ "simeji/winresizer" },
	{
		"folke/zen-mode.nvim",
		opts = {},
	},
	{
		'rmagatti/auto-session',
		lazy = false,
		dependencies = {
			'nvim-telescope/telescope.nvim',
		},
		keys = {
			-- Will use Telescope if installed or a vim.ui.select picker otherwise
			{ '<leader>wr', '<cmd>SessionSearch<CR>', desc = 'Session search' },
			{ '<leader>ws', '<cmd>SessionSave<CR>', desc = 'Save session' },
			{ '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
		},
		config = function()
			require('auto-session').setup({
				-- ⚠️ This will only work if Telescope.nvim is installed
				-- The following are already the default values, no need to provide them if these are already the settings you want.
				session_lens = {
					-- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
					load_on_setup = true,
					theme_conf = { border = true },
					previewer = false,
				},
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{
		"L3MON4D3/LuaSnip",
	},
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "RRethy/vim-illuminate" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		"NStefan002/screenkey.nvim",
		lazy = false,
		version = "*",
	},
	{ "tpope/vim-repeat" },
	{ "brenoprata10/nvim-highlight-colors" },
	{ "rcarriga/nvim-notify" },
  {
    "MunifTanjim/nui.nvim",
    event = "VimEnter",
  },
	{
		"numToStr/FTerm.nvim"
	},
}
-- PERF: setting a rounded border

local opts = {
	ui = {
		border = "rounded",
	},
}
require("lazy").setup(plugins, opts)
