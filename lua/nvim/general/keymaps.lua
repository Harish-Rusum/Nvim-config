-- PERF: Base
vim.keymap.set('n', '<Esc>', function() vim.cmd [[nohlsearch]] end)

-- PERF: mapping vim leader
vim.g.mapleader = " "

-- PERF: Alpha
vim.keymap.set("n", "<leader>;", function() vim.cmd[[Alpha]] end, { desc = "Dashboard" })

-- PERF: Telescope keymaps
vim.keymap.set("n", "<leader>tf", function() vim.cmd[[:Telescope fd]] end, { desc = "Fuzzy find files" })
vim.keymap.set("n", "<leader>tg", function() vim.cmd[[:Telescope live_grep]] end, { desc = "Live grep" })
vim.keymap.set("n", "<leader><leader>t", function() vim.cmd[[Telescope builtin]] end, {desc = "open telescope builtin"})
vim.keymap.set("n", "<leader>ts", function() vim.cmd[[:Telescope colorscheme]] end, {desc = "Colorscheme picker"})
vim.keymap.set("n", "<leader>tc", function() vim.cmd[[Telescope find_files cwd=~/.config/nvim/]] end, {desc = "Find config files"})
vim.keymap.set("n", "<leader>tdf", function() vim.cmd[[lua require('telescope.builtin').find_files(require('telescope.themes').get_cursor({}))]] end, {desc = "Find files"})
vim.keymap.set("n", "<leader>tif", function() vim.cmd[[lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))]] end, {desc = "Live grep"})
vim.keymap.set("n", "<leader>tig", function() vim.cmd[[lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))]] end, {desc = "Live grep"})

-- Notifications
vim.api.nvim_set_keymap('n', '<leader>nc', ':lua require("notify").dismiss()<CR>', { noremap = true, silent = true, desc = "Clear notifications"})

-- PERF: setting up terminal keymaps
vim.keymap.set('n', '<leader>tt', function() vim.cmd[[lua require("FTerm").toggle()]] end, { desc = "Floating terminal" })
vim.keymap.set('n', '<leader>t[', function() vim.cmd[[ToggleTerm direction=vertical size=70]] end, { desc = "vertical split" })
vim.keymap.set('n', '<leader>t]', function() vim.cmd[[ToggleTerm direction=horizontal size=17]] end, { desc = "horizontal split" })

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
vim.keymap.set("t", "`", [[<C-\><C-n>]])

-- PERF: zenmode
vim.keymap.set("n", "<leader>ze", function() vim.cmd [[set laststatus=0 | set nonu | set nornu | BufferLineGroupToggle ungrouped]] end, {desc = "Enable zenmode"})
vim.keymap.set("n", "<leader>zd", function() vim.cmd [[set laststatus=2 | set nu | set rnu | BufferLineGroupToggle ungrouped]] end, {desc = "Disable zenmode"})

-- PERF: make yanking always from the system clipboard
vim.keymap.set("n", "y", '"+y')
vim.keymap.set("v", "y", '"+y')
vim.keymap.set("v", "Y", '"+y')
vim.keymap.set("n", "Y", '"+Y')

-- PERF: nice things to have
vim.keymap.set("c", "W", "w")
vim.keymap.set("c", "Q", "q")
vim.keymap.set("n", "<leader><leader>c", "i<C-r>=", {desc = "open calculator"})
vim.keymap.set("n", "<leader>w", function() vim.cmd[[w]] end,{desc = "save file"})
vim.keymap.set("n", "<leader>q", function() vim.cmd[[q]] end,{desc = "quit file"})

vim.keymap.set("n", "<leader>cd", function() vim.cmd[[Trouble]] end, { desc = "Diagnostics using Trouble" })

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
