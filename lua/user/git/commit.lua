local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

local function prompt_user_input(callback)
  local input_popup = Input({
    position = "50%",
    size = {
      width = 40,
    },
    border = {
      style = "rounded",
      text = {
        top = "[ Commit Message ]",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  }, {
    prompt = " ❱ ",
    default_value = "",
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

local function git_commit(commit_message)
  local result = vim.fn.system({"git", "commit", "-m", commit_message})
  if vim.v.shell_error ~= 0 then
    print("Error committing: " .. result)
  else
    print("Commit successful!")
  end
end

vim.api.nvim_create_user_command("Git", function(opts)
  local subcommand = opts.args

  if subcommand == "commit" then
    prompt_user_input(function(commit_message)
      git_commit(commit_message)
    end)
  else
    print("Unknown Git subcommand: " .. subcommand)
  end
end, { nargs = 1, complete = function()
    return { "commit" }
  end })
