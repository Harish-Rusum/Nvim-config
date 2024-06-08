-- PERF: setting toggleterm (terminal) default shell to powershell

require('toggleterm').setup {
    size = 20,
    float_opts = {
        border = 'rounded',
    },
    persist_size = true, -- Persist the terminal size between uses
    shell = "pwsh", -- Use the default shell
}
