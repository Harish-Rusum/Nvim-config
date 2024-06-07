-- PERF: function for creating a popup

function CreatePopup()
	local buf = vim.api.nvim_create_buf(false, true)

	local lines = {
		"Reminder!"
	}
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.api.nvim_buf_set_option(buf, 'modifiable', false)

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

	vim.api.nvim_open_win(buf, true, opts)
end

-- PERF: function for getting the diffrence between the desired time and the current time

function TimeDiff(timeFromNow, unit)
	local current_time = os.time()
	local desired_time

	if unit == "minutes" then
		desired_time = current_time + (timeFromNow * 60)
	elseif unit == "seconds" then
		desired_time = current_time + timeFromNow
	else
		print("Invalid time unit. Use 'minutes' or 'seconds'.")
		return -1
	end

	local diff_seconds = desired_time - current_time
	return diff_seconds
end

-- PERF: setting up the actual command

vim.cmd([[
function! SetReminder(timeFromNow, unit)
let timeFromNow = a:timeFromNow
let unit = a:unit
let current_time = strftime("%s")
let desired_time = current_time + (unit == 'minutes' ? timeFromNow * 60 : timeFromNow)
let time_difference = desired_time - current_time
if time_difference > 0
	call timer_start(time_difference * 1000, {-> luaeval('CreatePopup()', [])})
	endif
	endfunction

	command! -nargs=+ SetReminder call SetReminder(<f-args>)
	]])

