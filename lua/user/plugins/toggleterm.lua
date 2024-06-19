-- PERF: setting toggleterm (terminal) default shell to powershell

require('toggleterm').setup {
    size = 20,
    float_opts = {
        border = 'rounded',
    },
    persist_size = true,
    shell = "pwsh",
}
