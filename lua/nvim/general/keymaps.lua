-- PERF: Base
vim.keymap.set("n", "<Esc>", function()
	vim.cmd([[nohlsearch]])
end)

-- PERF: mapping vim leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- PERF: Dashboard
vim.keymap.set("n", "<leader>;", function()
	vim.cmd([[lua Snacks.dashboard()]])
end, { desc = "Dashboard" })

-- PERF: Run commands
vim.keymap.set("n", "<leader>rc", function() vim.cmd([[RunCpp]]) end, { desc = "Compile and run C++" })

-- PERF: Smart delete
vim.keymap.set({"n","v"}, "<leader>d", [["_d]], {desc = 'Delete to unnamed reg'})

-- PERF: Copilot
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false
}, {silent = true})
vim.g.copilot_no_tab_map = true

-- PERF: lspsaga
vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga finder ref ++normal<CR>", { desc = "Find References floating popup" })
vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga finder def ++normal<CR>", { desc = "Find References floating popup" })
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next <CR>", { desc = "Find next diagnostic" })
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev <CR>", { desc = "Find previous diagnostic" })
vim.keymap.set("n", "<leader>lD", "<cmd>Lspsaga show_workspace_diagnostics ++normal <CR>", { desc = "Find Definitions" })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true })

-- PERF: Notifications
vim.api.nvim_set_keymap("n", "<leader>nc", ':lua require("notify").dismiss()<CR>', { noremap = true, silent = true, desc = "Clear notifications" })

-- PERF: splits
vim.keymap.set("n", "<leader>s[", function() vim.cmd([[vsplit]]) end, { desc = "split vertically" })
vim.keymap.set("n", "<leader>s]", function() vim.cmd([[sp]]) end, { desc = "split horizontally" })

-- PERF: Setting up cellular automaton
vim.keymap.set("n", "<leader>SR", ":CellularAutomaton make_it_rain<CR>", {desc = "Make ir rain", silent = true})
vim.keymap.set("n", "<leader>SS", ":CellularAutomaton scramble<CR>", {desc = "matrix effect", silent = true})

-- PERF: setting up terminal keymaps
vim.keymap.set({"n","t"}, "<C-t>", function() vim.cmd([[Floaterminal]]) end, { desc = "Floating terminal" })
vim.keymap.set("n", "<C-[>", function() vim.cmd("ToggleTerm direction=vertical size=70") end)
vim.keymap.set("t", "<C-[>", function() vim.cmd("ToggleTerm direction=vertical size=70") end)
vim.keymap.set("n", "<C-]>", function() vim.cmd("ToggleTerm direction=horizontal size=20") end)
vim.keymap.set("t", "<C-]>", function() vim.cmd("ToggleTerm direction=horizontal size=20") end)

-- PERF: setting up terminal keymaps
-- vim.keymap.set("n", "<leader>is", function() vim.cmd([[IBLToggleScope]]) end, { desc = "Toggle highlighting scope" })

-- PERF: git
vim.keymap.set("n", "<leader>gaa", function() vim.cmd([[G add]]) end, { desc = "git add" })
vim.keymap.set("n", "<leader>gar", function() vim.cmd([[G reset]]) end, { desc = "git remove" })
vim.keymap.set("n", "<leader>gac", function() vim.cmd([[G commit]]) end, { desc = "git commit" })
vim.keymap.set("n", "<leader>gap", function() vim.cmd([[G push]]) end, { desc = "git push" })
vim.keymap.set("n", "<leader>gas", function() vim.cmd([[G status]]) end, { desc = "git status" })
vim.keymap.set("n", "<leader>gal", function() vim.cmd([[G log]]) end, { desc = "git log" })
vim.keymap.set("n", "<leader>gap", function() vim.cmd([[G push]]) end, { desc = "git push" })
vim.keymap.set("n", "<leader>gai", function() vim.cmd([[G init]]) end, { desc = "git init" })
vim.keymap.set("n", "<leader>gai", function() vim.cmd([[G init]]) end, { desc = "git init" })

-- PERF: Snacks: Tree
vim.keymap.set("n", "<leader>e", function() vim.cmd[[lua Snacks.explorer()]] end, {desc = "File Explorer" })

-- PERF: Snacks : Git
vim.keymap.set( "n", "<leader>gb", function() vim.cmd[[lua Snacks.picker.git_branches()]] end, {desc = "Git Branches"})
vim.keymap.set( "n", "<leader>gl", function() vim.cmd[[lua Snacks.picker.git_log()]] end, {desc = "Git Log" })
vim.keymap.set( "n", "<leader>gs", function() vim.cmd[[lua Snacks.picker.git_status()]] end, {desc = "Git Status" })
vim.keymap.set( "n", "<leader>gd", function() vim.cmd[[lua Snacks.picker.git_diff()]] end, {desc = "Git Diff (Hunk)s"})
vim.keymap.set( "n", "<leader>gf", function() vim.cmd[[lua Snacks.picker.git_log_file()]] end, {desc = "Git Log File" })
vim.keymap.set( "n", "<leader>gS", function() vim.cmd[[lua Snacks.picker.git_stash()]] end, {desc = "Git Stash" })

-- PERF: Snacks : Registers
vim.keymap.set( "n", '<leader>f"', function() vim.cmd[[lua Snacks.picker.registers()]] end, {desc = "Registers"} )

-- PERF: Snacks: Find
vim.keymap.set("n", "<leader>ff", function() vim.cmd[[lua Snacks.picker.files()]] end, { desc = "Fuzzy find files" })
vim.keymap.set("n", "<leader>fs", function() vim.cmd[[lua Snacks.picker.colorschemes()]] end, { desc = "Color scheme picker" })
vim.keymap.set("n", "<C-p>", function() vim.cmd([[lua Snacks.picker.files()]]) end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function() vim.cmd([[lua Snacks.picker.grep()]]) end, { desc = "Live grep (search for word)" })
vim.keymap.set("n", "<leader>fb", function() vim.cmd([[lua Snacks.picker.buffers()]]) end, { desc = "Live emoji picker" })
vim.keymap.set("n", "<leader>fi", function() vim.cmd([[lua Snacks.picker.icons()]]) end, { desc = "Pick from icons" })
vim.keymap.set("n", "<leader><leader>f", function() vim.cmd([[lua Snacks.picker()]]) end, { desc = "Pick from all available pickers" })

-- PERF: Snacks : Man
vim.keymap.set("n", "<leader>fm", function() vim.cmd[[lua Snacks.picker.man()]] end, {desc = "Find man Pages"} )

-- PERF: harpoon
vim.keymap.set("n", "<C-h>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end)
vim.keymap.set("n", "<C-a>", function() require("harpoon"):list():add() end)

vim.keymap.set("n", "<leader>1", function() require("harpoon"):list():select(1) end, {desc = "Go to first harpoon item"})
vim.keymap.set("n", "<leader>2", function() require("harpoon"):list():select(2) end, {desc = "Go to second harpoon item"})
vim.keymap.set("n", "<leader>3", function() require("harpoon"):list():select(3) end, {desc = "Go to third harpoon item"})
vim.keymap.set("n", "<leader>4", function() require("harpoon"):list():select(4) end, {desc = "Go to fourth harpoon item"})
vim.keymap.set("n", "<C-1>", function() require("harpoon"):list():select(1) end, {desc = "Go to first harpoon item"})
vim.keymap.set("n", "<C-2>", function() require("harpoon"):list():select(2) end, {desc = "Go to second harpoon item"})
vim.keymap.set("n", "<C-3>", function() require("harpoon"):list():select(3) end, {desc = "Go to third harpoon item"})
vim.keymap.set("n", "<C-4>", function() require("harpoon"):list():select(4) end, {desc = "Go to fourth harpoon item"})

-- PERF: setting up LSP actions
vim.keymap.set("n", "<leader>cf", function() vim.cmd([[echo 'Formatted successfully' | Format]]) end, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>cg", function() vim.cmd([[lua vim.lsp.buf.definition()]]) end, { desc = "Go to file" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename variable" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code actions" })
vim.keymap.set("n", "<leader>cd", function() vim.cmd([[Trouble]]) end, { desc = "Diagnostics using Trouble" })
vim.keymap.set("n", "<leader>la", function() vim.cmd([[InspectTree]]) end, { desc = "open an ast (abstract syntax tere)" })

-- PERF: file explorer
vim.keymap.set("n", "e", function() vim.cmd([[Oil]]) end, { desc = "Open parent directory" })

-- PERF: window resizing
vim.keymap.set("n", ",", "<C-w>2>")
vim.keymap.set("n", ".", "<C-w>2<")
vim.keymap.set("n", "<C-,>", "<C-w>2-")
vim.keymap.set("n", "<C-.>", "<C-w>2+")
vim.keymap.set("n", "<C-Left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-Right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-Down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-Up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- PERF: setting up keymaps for buffers
vim.keymap.set("n", "<leader>bn", function() vim.cmd([[bnext]]) end, { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bt", function() vim.cmd([[BufferLineGroupToggle ungrouped]]) end, { desc = "Toggle buffers" })
vim.keymap.set("n", "<leader>bc", function() vim.cmd([[bdelete]]) end, { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bp", function() vim.cmd([[bprev]]) end, { desc = "Previous buffer" })
vim.keymap.set("n", "<Tab>", function() vim.cmd([[bn]]) end, { desc = "Toggle buffer focus" })

-- PERF: Vim be good
vim.keymap.set("n", "<leader>pv", function() vim.cmd([[VimBeGood]]) end, { desc = "Practice vim" })

-- PERF: other terminal keybindings
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- PERF: zenmode
vim.keymap.set("n", "<leader>ze", function() vim.cmd([[set laststatus=0 | set nonu | set nornu | BufferLineGroupToggle ungrouped]]) end, { desc = "Enable zenmode" })
vim.keymap.set("n", "<leader>zd", function() vim.cmd([[set laststatus=2 | set nu | set rnu | BufferLineGroupToggle ungrouped]]) end, { desc = "Disable zenmode" })

-- PERF: make yanking always from the system clipboard
vim.keymap.set("n", "<C-v>", "p")
vim.keymap.set("v", "<C-p>", "p")
vim.keymap.set("n", "<C-c>", "y")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("v", "<C-c>", "y")
vim.api.nvim_set_keymap("n", "<S-Up>", "<Esc>V<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Down>", "<Esc>V<Down>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Up>", "<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Down>", "<Down>", { noremap = true, silent = true })

-- PERF: nice things to have
vim.keymap.set("c", "W", "w")
vim.keymap.set("c", "Q", "q")
vim.keymap.set("n", "<leader><leader>c", "i<C-r>=", { desc = "open calculator" })
vim.keymap.set("n", "123", "<Esc>", { desc = "open calculator" })
vim.keymap.set("i", "123", "<Esc>", { desc = "open calculator" })
vim.keymap.set("n", "<leader>w", function() vim.cmd([[w]]) end, { desc = "save file" })
vim.keymap.set("n", "<leader>q", function() vim.cmd([[q!]]) end, { desc = "quit file" })
vim.keymap.set("n", "<leader>cp", function() vim.cmd([[Glow %]]) end, { desc = "Preview markdown files" })
vim.keymap.set("i", "<C-w>", "<C-o>diw", { desc = "Delete a word backwards in insert mode", silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })
vim.keymap.set("v", "<", "<gv", { silent = true })

local is_transparent = false

function ToggleTransparency()
	is_transparent = not is_transparent
	require("catppuccin").setup({
		transparent_background = is_transparent,
	})
	vim.cmd.colorscheme("catppuccin")
	vim.cmd([[highlight Visual guibg=#2f2f3f guifg=none]])
	vim.cmd([[highlight WinSeparator guifg=#383646 guibg=none]])
	local colors = require("catppuccin.palettes").get_palette("mocha")

	vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = "NONE", fg = "#FCFFC1" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { bg = "NONE", fg = "#FCFFC1" })
	vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = "#FCFFC1" })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = "#FCFFC1" })
end

vim.api.nvim_set_keymap("n", "<leader>T", ":lua ToggleTransparency()<CR>", { noremap = true, silent = true, desc = "Toggle transparent background" })

vim.keymap.set("n", "<leader><leader>p", function()
    local current_file = vim.api.nvim_buf_get_name(0)
    if current_file == "" then
        print("No file currently open")
        return
    end

    local current_dir = vim.fn.fnamemodify(current_file, ":p:h")
    vim.api.nvim_set_current_dir(current_dir)
    print("Changed root directory to " .. current_dir)
end, { desc = "Change root dir to this dir" })
