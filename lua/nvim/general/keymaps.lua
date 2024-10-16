-- PERF: Base
vim.keymap.set('n', '<Esc>', function() vim.cmd [[nohlsearch]] end)


-- PERF: mapping vim leader
vim.g.mapleader = " "


-- PERF: Alpha
vim.keymap.set("n", "<leader>;", function() vim.cmd[[Alpha]] end, { desc = "Dashboard" })


-- PERF: Telescope keymaps
vim.keymap.set("n", "<leader>ff", function() vim.cmd[[:Telescope fd]] end, { desc = "Fuzzy find files" })
vim.keymap.set("n", "<leader>fg", function() vim.cmd[[:Telescope live_grep]] end, { desc = "Live grep" })
vim.keymap.set("n", "<leader><leader>f", function() vim.cmd[[Telescope builtin]] end, {desc = "open telescope(finder) builtin"})
vim.keymap.set("n", "<leader>fs", function() vim.cmd[[:Telescope colorscheme]] end, {desc = "Colorscheme picker"})
vim.keymap.set("n", "<leader>fc", function() vim.cmd[[Telescope find_files cwd=~/.config/nvim/]] end, {desc = "Find config files"})


-- PERF: Notifications
vim.api.nvim_set_keymap('n', '<leader>nc', ':lua require("notify").dismiss()<CR>', { noremap = true, silent = true, desc = "Clear notifications"})


-- PERF: splits
vim.keymap.set("n", "<leader>s[", function() vim.cmd[[vsplit]] end, {desc = "split vertically"})
vim.keymap.set("n", "<leader>s]", function() vim.cmd[[sp]] end, {desc = "split horizontally"})


-- PERF: themes.
vim.keymap.set("n", "<leader>Tt", function() vim.cmd[[:PickTelescopeTheme]] end, {desc = "Pick telescope (finder) themes"})
vim.keymap.set("n", "<leader>Tl", function() vim.cmd[[:PickLualineTheme]] end, {desc = "Pick lualine (statusbar) themes"})


-- PERF: setting up terminal keymaps
vim.keymap.set('n', '<C-t>', function() vim.cmd[[lua require("FTerm").toggle()]] end, { desc = "Floating terminal" })
vim.keymap.set("n", "<C-[>", function() vim.cmd("ToggleTerm direction=vertical size=70") end)
vim.keymap.set("t", "<C-[>", function() vim.cmd("ToggleTerm direction=vertical size=70") end)
vim.keymap.set("n", "<C-]>", function() vim.cmd("ToggleTerm direction=horizontal size=20") end)
vim.keymap.set("t", "<C-]>", function() vim.cmd("ToggleTerm direction=horizontal size=20") end)


-- PERF: lualine (statusbar)
vim.keymap.set('n', '<leader>le', function() vim.cmd[[set laststatus=2]] end, {desc = "Enable lualine (statusbar)"})
vim.keymap.set('n', '<leader>ld', function() vim.cmd[[set laststatus=0]] end, {desc = "Disable lualine (statusbar)"})


-- PERF: git
vim.keymap.set('n', '<leader>ga', function() vim.cmd[[G add]] end, {desc = "git add"})
vim.keymap.set('n', '<leader>gr', function() vim.cmd[[G reset]] end, {desc = "git remove"})
vim.keymap.set('n', '<leader>gc', function() vim.cmd[[G commit]] end, {desc = "git commit"})
vim.keymap.set('n', '<leader>gp', function() vim.cmd[[G push]] end, {desc = "git push"})
vim.keymap.set('n', '<leader>gs', function() vim.cmd[[G status]] end, {desc = "git status"})
vim.keymap.set('n', '<leader>gl', function() vim.cmd[[G log]] end, {desc = "git log"})
vim.keymap.set('n', '<leader>gp', function() vim.cmd[[G push]] end, { desc = "git push" })
vim.keymap.set('n', '<leader>gi', function() vim.cmd[[G init]] end, {desc = "git init"})


-- PERF: setting up LSP actions
vim.keymap.set("n", "<leader>cf", function() vim.cmd [[echo 'Formatted successfully' | Format]] end, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>cg", function() vim.cmd[[lua vim.lsp.buf.definition()]] end, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename variable" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code actions" })
vim.keymap.set("n", "<leader>cd", function() vim.cmd[[Trouble]] end, { desc = "Diagnostics using Trouble" })

-- PERF: chtshts
vim.keymap.set("n", "<leader>vc", function() vim.cmd[[e ~/.config/nvim/lua/nvim/chtshts/chtsht.md]] end, { desc = "Open vim cheat sheat" })
vim.keymap.set("n", "<leader>vb", function() vim.cmd[[e ~/.config/nvim/lua/nvim/chtshts/files.md]] end, { desc = "Files in vim chtsht" })
vim.keymap.set("n", "<leader>vf", function() vim.cmd[[e ~/.config/nvim/lua/nvim/chtshts/general.md]] end, { desc = "How to do stuff in this config" })


-- PERF: file explorer
vim.keymap.set("n", "e", function() vim.cmd[[Oil]] end, { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>e", function() vim.cmd[[Neotree toggle]] end, { desc = "Open parent directory in tree format" })


-- PERF: window resizing
vim.keymap.set("n", ",", "<C-w>2>")
vim.keymap.set("n", ".", "<C-w>2<")
vim.keymap.set("n", "<C-,>", "<C-w>2-")
vim.keymap.set("n", "<C-.>", "<C-w>2+")


-- PERF: setting up keymaps for buffers
vim.keymap.set("n", "<leader>bn", function() vim.cmd[[bnext]] end, { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bt", function() vim.cmd[[BufferLineGroupToggle ungrouped]] end, { desc = "Toggle buffers" })
vim.keymap.set("n", "<leader>bc", function() vim.cmd[[bdelete]] end, { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bp", function() vim.cmd[[bprev]] end, { desc = "Previous buffer" })
vim.keymap.set("n", "<Tab>", function() vim.cmd[[bn]] end, { desc = "Toggle buffer focus" })


-- PERF: Vim be good
vim.keymap.set("n", "<leader>pv", function() vim.cmd [[VimBeGood]] end, {desc = "Practice vim"})


-- PERF: other terminal keybindings
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })


-- PERF: zenmode
vim.keymap.set("n", "<leader>ze", function() vim.cmd [[set laststatus=0 | set nonu | set nornu | BufferLineGroupToggle ungrouped]] end, {desc = "Enable zenmode"})
vim.keymap.set("n", "<leader>zd", function() vim.cmd [[set laststatus=2 | set nu | set rnu | BufferLineGroupToggle ungrouped]] end, {desc = "Disable zenmode"})


-- PERF: make yanking always from the system clipboard
vim.keymap.set("n", "y", '"+y')
vim.keymap.set("v", "y", '"+y')
vim.keymap.set("v", "Y", '"+y')
vim.keymap.set("n", "Y", '"+Y')
vim.keymap.set("n", "<C-v>", '"*p')
vim.keymap.set("n", "<C-c>", '"*y')
vim.keymap.set("i", "<C-v>", '"*p')
vim.api.nvim_set_keymap('n', '<S-Up>', '<Esc>V<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Down>', '<Esc>V<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Up>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Down>', '<Down>', { noremap = true, silent = true })

-- PERF: nice things to have
vim.keymap.set("c", "W", "w")
vim.keymap.set("c", "Q", "q")
vim.keymap.set("n", "<leader><leader>c", "i<C-r>=", {desc = "open calculator"})
vim.keymap.set("n", "<leader>w", function() vim.cmd[[w]] end,{desc = "save file"})
vim.keymap.set("n", "<leader>q", function() vim.cmd[[q]] end,{desc = "quit file"})

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

vim.keymap.set("n", "<leader>cp", function() vim.cmd[[Glow %]] end, { desc = "Preview markdown files" })
vim.keymap.set("i", "<C-w>", "<Esc>diwi", { desc = "Delete a word backwards in insert mode" })
