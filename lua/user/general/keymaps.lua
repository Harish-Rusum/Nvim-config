-- PERF: mapping vim leader

vim.g.mapleader = " "

-- PERF: Telescope keymaps

vim.keymap.set("n", "<leader>tf", function()
	vim.cmd([[:Telescope fd]])
end, { desc = "fuzzy find files" })
vim.keymap.set("n", "<leader>tg", function()
	vim.cmd([[:Telescope live_grep]])
end, { desc = "live grep" })

-- PERF: setting up terminal keymaps

vim.keymap.set('n','<leader>tt', '<CMD>lua require("FTerm").toggle()<CR>', {desc = "Floating terminal"})

-- PERF: setting up lsp actions

vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "format buffer" })
vim.keymap.set("n", "<leader>cg", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "goto file" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Renames a variable under the cursor" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "lsp code actions" })
vim.keymap.set("n", "e", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- PERF: window resizing

vim.keymap.set("n", ">", "<C-w>><C-w>>")
vim.keymap.set("n", "<", "<C-w><<C-w><")

-- PERF: setting up keymaps for buffers

vim.keymap.set("n", "<leader>bn", ":bnext<Enter>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>bc", ":bdelete<Enter>", { desc = "close current buffer" })
vim.keymap.set("n", "<leader>bp", ":bprev<Enter>", { desc = "previous buffer" })
vim.keymap.set("n", "<Tab>", ":bn<Enter>", { desc = "toggles buffer focus" })

-- PERF: other terminal keybindings

vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])
vim.keymap.set("n", "<C-w><RightArrow>", "<C-w><RightArrow>i")
vim.keymap.set("t", "`", [[<C-\><C-n>]])

-- PERF: setting up keymaps for code folding

vim.keymap.set("v", "<leader>ff", "zf")
vim.keymap.set("v", "<leader>fo", "zo")

-- PERF: make yanking always from the sys clipboard 
vim.keymap.set("n", "y", '"+y')
vim.keymap.set("v", "y", '"+y')
vim.keymap.set("n", "Y", '"+Y')

-- PERF: chtsht
vim.cmd [[command! Chtsht edit ~/.config/nvim/lua/chtsht.md]]
vim.cmd [[command! CH edit ~/.config/nvim/lua/chtsht.md]]

-- PERF: remainder stuff

vim.keymap.set("n", "<leader>sr", ":SetReminder<CR>")

-- PERF: nice things to have

vim.keymap.set("c", "W", "w")
vim.keymap.set("c", "Q", "q")
vim.keymap.set("n", "s", "^")


vim.keymap.set("n", "<leader>cd", ":Trouble<Enter>1<Enter>", { desc = "diagnostics using trouble" })

vim.keymap.set("n", "<leader><leader>p", function()
	local current_file = vim.api.nvim_buf_get_name(0)
	if current_file == "" then
		print("No file currently open")
		return
	end

	local current_dir = vim.fn.fnamemodify(current_file, ":p:h")
	vim.api.nvim_set_current_dir(current_dir)
	print("Changed root directory to " .. current_dir)
end, { desc = "changes the root dir to this dir" })

vim.keymap.set(
	"n",
	"<leader>ze",
	":ZenMode<Enter>:set nornu<Enter>:set nonu<Enter>:<Backspace>",
	{ desc = "activate zenmode" }
)

vim.keymap.set(
	"n",
	"<leader>zd",
	":ZenMode<Enter>:set nu<Enter>:set rnu<Enter>:<Backspace>",
	{ desc = "deactivate zenmode" }
)

vim.keymap.set("n", "<leader>cp", ":Glow %<Enter>", { desc = "preview for markdown files" })
vim.keymap.set("i", "<C-w>", "<Esc>diwi", { desc = "preview for markdown files" })

-- PERF: Harpoon keymaps
vim.keymap.set("n", "<leader>hh", function()
	vim.cmd([[:lua require("harpoon.ui").toggle_quick_menu()]])
end, { desc = "harpoon ui toggle" })
vim.keymap.set("n", "<leader>ha", function()
	vim.cmd([[:lua require("harpoon.mark").add_file()]])
end, { desc = "add current file to the harpoon menu" })
