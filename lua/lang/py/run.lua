local function run_python_script()
  local file = vim.fn.expand("%")
  local run_cmd = string.format("clear && python3 %s", file)
  require("toggleterm").exec(run_cmd, 1)
end
vim.api.nvim_create_user_command("RunPython", run_python_script, {})
