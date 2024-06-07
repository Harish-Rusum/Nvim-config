-- PERF: setting toggleterm (terminal) default shell to powershell

require('toggleterm').setup{
	persist_size = true, -- Persist the terminal size between uses
	shell = "pwsh", -- Use the default shell
}
