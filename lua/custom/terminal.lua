-- ============================================
-- Floating Terminal + RunCpp
-- ============================================

local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

-- --------------------------------------------
-- Create floating window
-- --------------------------------------------
local function create_floating_window(opts)
  opts = opts or {}

  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2) - 1

  local buf
  if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  })

  return { buf = buf, win = win }
end

-- --------------------------------------------
-- Toggle terminal (supports complex commands)
-- --------------------------------------------
local function toggle_terminal(opts)
  opts = opts or {}
  local cmd = opts.args ~= "" and opts.args or nil

  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window { buf = state.floating.buf }

    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      if cmd then
        -- Run through shell for complex commands
        vim.fn.termopen({ vim.o.shell, "-c", cmd })
      else
        vim.cmd("terminal")
      end
    end

    vim.api.nvim_set_current_buf(state.floating.buf)
    vim.cmd("startinsert")
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

-- --------------------------------------------
-- User Command: :Floaterminal {command}
-- --------------------------------------------
vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {
  nargs = "*",
})

-- --------------------------------------------
-- User Command: :RunCpp
-- Compiles current file and runs it
-- --------------------------------------------
vim.api.nvim_create_user_command("RunCpp", function()
  local file = vim.fn.expand("%")
  local exe = vim.fn.expand("%:r")

  if file == "" then
    print("No file detected.")
    return
  end

  -- Modify flags here to your liking
  local compile_cmd = string.format(
    "g++ %s -std=c++23 -O2 -o output && ./output",
    file,
    exe,
    exe
  )

  toggle_terminal({ args = compile_cmd })
end, {})

