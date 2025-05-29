-- PERF: setting up the preview in the whcih key menu

require("which-key").register(
  {
    { "<leader><leader>", group = "Other" },
    { "<leader><leader>_", hidden = true },
    { "<leader>b", group = "Buffer" },
    { "<leader>b_", hidden = true },
    { "<leader>c", group = "Code" },
    { "<leader>c_", hidden = true },
    { "<leader>f", group = "Find" },
    { "<leader>f_", hidden = true },
    { "<leader>g", group = "Git" },
    { "<leader>g_", hidden = true },
    { "<leader>ga", group = "Git action" },
    { "<leader>ga_", hidden = true },
    { "<leader>i", group = "Indent lines" },
    { "<leader>i_", hidden = true },
    { "<leader>l", group = "Lsp" },
    { "<leader>l_", hidden = true },
    { "<leader>m", group = "Split or Join Code Blocks" },
    { "<leader>n", group = "Notifications" },
    { "<leader>n_", hidden = true },
    { "<leader>p", group = "Practice" },
    { "<leader>p_", hidden = true },
    { "<leader>s", group = "Split pane" },
    { "<leader>s_", hidden = true },
    { "<leader>t", group = "Transparent bg" },
    { "<leader>t_", hidden = true },
    { "<leader>z", group = "Zen mode" },
    { "<leader>z_", hidden = true },
  }
)

-- PERF: making which key have a rounder border

require("which-key").setup({
	window = {
		border = "rounded",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 2, 2, 2, 2 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	},
})
