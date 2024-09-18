local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

local function prompt_user_input(callback, prompt_text, default_value)
	local input_popup = Input({
		position = "50%",
		size = {
			width = 40,
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

-- Git commit
local function git_commit(commit_message)
	run_git_command({ "git", "commit", "-m", commit_message })
end

-- Git add
local function git_add(files)
	run_git_command({ "git", "add", files })
end

-- Git remove
local function git_remove(files)
	run_git_command({ "git", "rm", files })
end

vim.api.nvim_create_user_command("Git", function(opts)
	local subcommand = opts.args

	if subcommand == "commit" then
		prompt_user_input(function(commit_message)
			git_commit(commit_message)
		end, "[ Commit Message ]")
	elseif subcommand == "add" then
		prompt_user_input(function(files)
			git_add(files)
		end, "[ Files to Add ]")
	elseif subcommand == "remove" then
		prompt_user_input(function(files)
			git_remove(files)
		end, "[ Files to Remove ]")
	else
		print("Unknown Git subcommand: " .. subcommand)
	end
end, {
	nargs = 1,
	complete = function()
		return { "commit", "add", "remove" }
	end,
})
