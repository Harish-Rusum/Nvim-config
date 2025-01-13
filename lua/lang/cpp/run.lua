
-- C++ running support
local function compile_and_run_cpp()
  local file = vim.fn.expand("%")
  local output = "output"

  local compile_cmd = string.format("g++ %s -o %s && clear && ./%s", file, output, output)

  require("toggleterm").exec(compile_cmd, 1)
end

vim.api.nvim_create_user_command("RunCpp", compile_and_run_cpp, {})
