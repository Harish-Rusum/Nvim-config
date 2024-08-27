local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

-- Function to create the reminder popup
function CreatePopup()
	local buf = vim.api.nvim_create_buf(false, true)

	local lines = {
		"Reminder!",
	}
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.api.nvim_buf_set_option(buf, "modifiable", false)

	local width = 60
	local height = 10
	local opts = {
		style = "minimal",
		relative = "editor",
		width = width,
		height = height,
		row = (vim.o.lines - height) / 2,
		col = (vim.o.columns - width) / 2,
		border = "rounded",
	}

	vim.api.nvim_open_win(buf, true, opts)
end

-- Function to get the difference between the desired time and the current time
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

-- Function to set the reminder using nui.nvim input
function SetReminder()
	local input = Input({
		position = "50%",
		size = {
			width = 40,
		},
		border = {
			style = "rounded",
			text = {
				top = "Set Reminder",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		prompt = "❱ ",
		default_value = "",
		on_submit = function(value)
			local timeFromNow, unit = value:match("(%d+)%s*(%a+)")
			timeFromNow = tonumber(timeFromNow)
			if timeFromNow and (unit == "minutes" or unit == "seconds") then
				local time_difference = TimeDiff(timeFromNow, unit)
				if time_difference > 0 then
					vim.fn.timer_start(time_difference * 1000, function()
						CreatePopup()
					end)
				end
			else
				print("Invalid input. Use format '<number> <unit>' where unit is 'minutes' or 'seconds'.")
			end
		end,
	})

	input:mount()

	input:on(event.BufLeave, function()
		input:unmount()
	end)
end

-- Setting up the actual command
vim.api.nvim_create_user_command("SetReminder", function()
	SetReminder()
end, {})
