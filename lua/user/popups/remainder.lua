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

function TimeDiff(MinFromNow)
    local current_time = os.time()
    local desired_time = current_time + (MinFromNow * 60)
    local diff_seconds = desired_time - current_time
    return diff_seconds
end

function TriggerPopup(MinFromNow)
    local time_difference = TimeDiff(MinFromNow)
    if time_difference > 0 then
        vim.defer_fn(CreatePopup, time_difference * 1000)
    end
end

vim.cmd([[command! -nargs=1 SetReminder lua TriggerPopup(<args>)]])

