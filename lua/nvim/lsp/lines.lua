-- PERF: In-depth cool lookin' lsp errors

require("lsp_lines").setup()

-- PERF: Remove normal lsp error messages
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)
