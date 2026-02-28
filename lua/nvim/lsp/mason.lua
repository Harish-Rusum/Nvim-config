-- PERF: setting up mason with rounded borders
require("mason").setup({
    ui = {
        border = "rounded",
    },
})

-- PERF: mason-lspconfig installs servers but does NOT auto-attach them
-- require("mason-lspconfig").setup({
--     ensure_installed = { "pyright", "lua_ls", "clangd" },
--     automatic_installation = false, -- important: prevents auto-setup
-- })

-- PERF: manual setup of language servers

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Only attach lua_ls if there isn't already one for this root
local already_attached = false
for _, c in pairs(vim.lsp.get_active_clients()) do
    if c.name == "lua_ls" and c.root_dir == vim.loop.cwd() then
        already_attached = true
    end
end

if not already_attached then
    lspconfig.lua_ls.setup({ capabilities = capabilities })
end
