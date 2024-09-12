
-- PERF: mapping vim leader
vim.g.mapleader = " "

-- PERF: Telescope keymaps
vim.keymap.set("n", "<leader>tf", function() vim.cmd[[:Telescope fd]] end, { desc = "Fuzzy find files" })
vim.keymap.set("n", "<leader>tg", function() vim.cmd[[:Telescope live_grep]] end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>tc", function() vim.cmd[[:Telescope current_buffer_fuzzy_find]] end, { desc = "Current buffer fuzzy find" })
vim.keymap.set("n", "<leader><leader>t", function() vim.cmd[[Telescope builtin]] end, {desc = "open telescope builtin"})
vim.keymap.set("n", "<leader>ts", function() vim.cmd[[lua colorscheme_picker()]] end)

-- PERF: setting up terminal keymaps
vim.keymap.set('n', '<leader>tt', function() vim.cmd[[lua require("FTerm").toggle()]] end, { desc = "Floating terminal" })
vim.keymap.set('n', '<leader>t[', function() vim.cmd[[ToggleTerm direction=vertical size=70]] end, { desc = "vertical split" })
vim.keymap.set('n', '<leader>t]', function() vim.cmd[[ToggleTerm direction=horizontal size=17]] end, { desc = "horizontal split" })

-- PERF: setting up AI (avante)
vim.keymap.set('n', '<leader>aa', function() vim.cmd[[AvanteChat]] end, {desc = "Chat with ai"})

-- PERF: setting up LSP actions
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>cg", function() vim.cmd[[lua vim.lsp.buf.definition()]] end, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename variable" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code actions" })

-- PERF: chtshts
vim.keymap.set("n", "<leader>vc", function() vim.cmd[[e ~/.config/nvim/lua/user/chtshts/chtsht.md]] end, { desc = "Open vim cheat sheat" })
vim.keymap.set("n", "<leader>vb", function() vim.cmd[[e ~/.config/nvim/lua/user/chtshts/files.md]] end, { desc = "Files in vim chtsht" })

-- PERF: file explorer
vim.keymap.set("n", "e", function() vim.cmd[[Oil]] end, { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>e", function() vim.cmd[[Neotree toggle]] end, { desc = "Open parent directory in tree format" })

-- PERF: window resizing
vim.keymap.set("n", ">", function() vim.cmd[[<C-w>><C-w>>]] end)
vim.keymap.set("n", "<", function() vim.cmd[[<C-w><<C-w><]] end)

-- PERF: setting up keymaps for buffers
vim.keymap.set("n", "<leader>bn", function() vim.cmd[[bnext]] end, { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bc", function() vim.cmd[[bdelete]] end, { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bp", function() vim.cmd[[bprev]] end, { desc = "Previous buffer" })
vim.keymap.set("n", "<Tab>", function() vim.cmd[[bn]] end, { desc = "Toggle buffer focus" })

-- PERF: other terminal keybindings
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])
vim.keymap.set("n", "<C-w><RightArrow>", function() vim.cmd[[<C-w><RightArrow>i]] end)
vim.keymap.set("t", "`", [[<C-\><C-n>]])

-- PERF: setting up keymaps for code folding
vim.keymap.set("v", "<leader>ff", function() vim.cmd[[zf]] end)
vim.keymap.set("v", "<leader>fo", function() vim.cmd[[zo]] end)

-- PERF: make yanking always from the system clipboard
vim.keymap.set("n", "y", '"+y')
vim.keymap.set("v", "y", '"+y')
vim.keymap.set("n", "Y", '"+Y')

-- PERF: remainder stuff
vim.keymap.set("n", "<leader>sr", function() vim.cmd[[SetReminder]] end)

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

-- PERF: Harpoon keymaps
vim.keymap.set("n", "<leader>hh", function() vim.cmd[[lua require("harpoon.ui").toggle_quick_menu()]] end, { desc = "Harpoon UI toggle" })
vim.keymap.set("n", "<leader>ha", function() vim.cmd[[lua require("harpoon.mark").add_file()]] end, { desc = "Add current file to Harpoon" })
