-- Function to create a popup window
local function create_popup()
	-- Define the buffer
	local buf = vim.api.nvim_create_buf(false, true)

	-- Set the content of the buffer
	local lines = {
		"some pop-up"
	}
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.api.nvim_buf_set_option(buf, 'modifiable', false)
	-- Define the window options
	local width = 60
	local height = 10
	local opts = {
		style = "minimal",
		relative = "editor",
		width = width,
		height = height,
		row = (vim.o.lines - height) / 2,
		col = (vim.o.columns - width) / 2,
		border = "rounded"
	}

	-- Create the window
	vim.api.nvim_open_win(buf, true, opts)
end

-- Register the command to call the function
vim.api.nvim_create_user_command('ShowPopup', create_popup, {})
