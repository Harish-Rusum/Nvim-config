local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

local function prompt_user_input(callback, prompt_text, default_value)
	local input_popup = Input({
		position = "50%",
		size = {
			width = 60,
		},
		border = {
			style = "rounded",
			text = {
				top = prompt_text,
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
	}, {
		prompt = " ❱ ",
		default_value = default_value or "",
		on_submit = function(value)
			if callback then
				callback(value)
			end
		end,
	})

	input_popup:mount()

	input_popup:on(event.BufLeave, function()
		input_popup:unmount()
	end)
end

-- Function to run git commands
local function run_git_command(command_args)
	local result = vim.fn.system(command_args)
	if vim.v.shell_error ~= 0 then
		print("Error: " .. result)
	else
		print("Command successful!")
	end
end

local function git_commit(commit_message)
	run_git_command({ "git", "commit", "-m", commit_message })
end

local function git_add(files)
	run_git_command({ "git", "add", files })
end

local function git_status()
	local result = vim.fn.system({ "git", "status" })
	print(result)
end

local function git_log()
	local result = vim.fn.system({ "git", "log" })
	print(result)
end

local function git_init()
	local result = vim.fn.system({ "git", "init" })
	print(result)
end

local function git_reset(files)
	run_git_command({ "git", "reset", files })
end

vim.api.nvim_create_user_command("G", function(opts)
	local subcommand = opts.args

	if subcommand == "commit" then
		prompt_user_input(function(commit_message)
			git_commit(commit_message)
		end, "[ Commit Message ]")
	elseif subcommand == "add" then
		prompt_user_input(function(files)
			git_add(files)
		end, "[ Files to Add ]")
	elseif subcommand == "reset" then
		prompt_user_input(function(files)
			git_reset(files)
		end, "[ Files to reset ]")
	elseif subcommand == "status" then
		git_status()
	elseif subcommand == "log" then
		git_log()
	elseif subcommand == "init" then
		git_init()
	else
		print("Unknown Git subcommand: " .. subcommand)
	end
end, {
	nargs = 1,
	complete = function()
		return { "commit", "add", "reset", "status", "log", "init"}
	end,
})
