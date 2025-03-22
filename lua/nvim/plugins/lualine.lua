-- -- PERF: defining theme colors with Catppuccin blue/violet tones
-- local colors = {
-- 	none = "none",
-- 	darkpurple = "none",
-- 	-- darkpurple = "#232232",
-- 	skintone = "#eabdbb",
-- 	darkblue = "#2d3342",
-- 	darkviolet = "#2d2c3c",
-- 	grey = "#6c7086",
-- 	red = "#f38ba8",
-- 	violet = "#d291f1",
-- 	white = "#dce0e8",
-- }
--
-- -- PERF: Mapping the colors to lualine sections
-- local theme = {
-- 	normal = {
-- 		a = { bg = colors.skintone, fg = colors.darkblue, gui = "bold" },
-- 		b = { bg = colors.darkviolet, fg = colors.white },
-- 		c = { bg = colors.darkpurple, fg = colors.grey },
-- 	},
-- 	insert = {
-- 		a = { bg = colors.red, fg = colors.darkblue, gui = "bold" },
-- 		b = { bg = colors.darkviolet, fg = colors.white },
-- 		c = { bg = colors.darkpurple, fg = colors.grey },
-- 	},
-- 	command = {
-- 		a = { bg = colors.violet, fg = colors.darkblue, gui = "bold" },
-- 		b = { bg = colors.darkviolet, fg = colors.white },
-- 		c = { bg = colors.darkpurple, fg = colors.grey },
-- 	},
-- 	visual = {
-- 		a = { bg = colors.red, fg = colors.darkblue, gui = "bold" },
-- 		b = { bg = colors.darkviolet, fg = colors.white },
-- 	},
-- 	replace = {
-- 		a = { bg = colors.red, fg = colors.darkblue, gui = "bold" },
-- 		b = { bg = colors.darkviolet, fg = colors.white },
-- 		c = { bg = colors.none, fg = colors.grey },
-- 	},
-- }
--
-- -- PERF: Actually setting up lualine (the statusbar)
-- require("lualine").setup({
-- 	options = {
-- 		icons_enabled = true,
-- 		theme = theme,
-- 		globalstatus = true,
-- 		component_separators = { left = "/", right = "│" },
-- 		section_separators = { left = "", right = "" },
-- 		disabled_filetypes = { statusline = {}, winbar = {} },
-- 		always_divide_middle = true,
-- 		refresh = {
-- 			statusline = 1000,
-- 			tabline = 1000,
-- 			winbar = 1000,
-- 		},
-- 	},
--
-- 	-- PERF: Defining sections with diagnostic symbols and LSP/filetype color sync
-- 	sections = {
-- 		lualine_a = {
-- 			function()
-- 				local mode_map = {
-- 					n = "NORMAL",
-- 					i = "INSERT",
-- 					v = "VISUAL",
-- 					V = "V-LINE",
-- 					c = "COMMAND",
-- 					t = "TERMINAL",
-- 					R = "REPLACE",
-- 				}
-- 				local current_mode = vim.fn.mode()
-- 				return " " .. (mode_map[current_mode] or current_mode:upper()) -- Default to uppercase if mode not found
-- 			end,
-- 		},
--
-- 		lualine_b = {
-- 			"branch",
-- 			{
-- 				"diagnostics",
-- 				sources = { "nvim_diagnostic" },
-- 				symbols = { error = " ", warn = " ", info = " ", hint = " " },
-- 				diagnostics_color = {
-- 					error = { fg = colors.red },
-- 					warn = { fg = colors.violet },
-- 					info = { fg = colors.skintone },
-- 					hint = { fg = colors.violet },
-- 				},
-- 			},
-- 		},
-- 		lualine_c = {
-- 			{
-- 				"diff",
-- 				symbols = {
-- 					added = " ",
-- 					modified = " ",
-- 					removed = " ",
-- 				},
-- 			}
-- 		},
-- 		lualine_d = { "" },
-- 		lualine_x = {
-- 			{
-- 				"filetype",
-- 				colored = false,
-- 				icon_only = true,
-- 				icon = { align = "right" },
-- 				separator = "|",
-- 				color = { fg = colors.grey, gui = "bold" },
-- 			},
-- 			{
-- 				function()
-- 					local clients = vim.lsp.buf_get_clients()
-- 					local client_names = {}
--
-- 					for _, client in pairs(clients) do
-- 						if client.name ~= "null-ls" then
-- 							table.insert(client_names, client.name)
-- 						end
-- 					end
--
-- 					local sources = require("null-ls.sources").get_available(vim.bo.filetype)
-- 					local unique_sources = {}
--
-- 					for _, source in ipairs(sources) do
-- 						if not unique_sources[source.name] then
-- 							table.insert(client_names, source.name)
-- 							unique_sources[source.name] = true
-- 						end
-- 					end
--
-- 					return #client_names > 0 and "[" .. table.concat(client_names, ", ") .. "]" or ""
-- 				end,
-- 				color = { fg = colors.grey, gui = "bold" },
-- 			},
-- 		},
-- 		lualine_y = {
-- 			{
-- 				function()
-- 					return "󰉋 " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
-- 				end,
-- 				color = { fg = colors.grey },
-- 			},
-- 		},
-- 		lualine_z = { "location" },
-- 	},
-- })

-- ------------------------------------------------------------------------ --
--                             CUSTOM FUNCTIONS                             --
-- ------------------------------------------------------------------------ --

-- LSP Server Attach Status
local function lsp_name()
  -- local clients = vim.lsp.get_active_clients()  -- Deprecated
  local clients = vim.lsp.get_clients()
  local buffer = vim.api.nvim_get_current_buf()

  -- SHOW AN ICON IF LSP IS ATTACHED ON CURRENT BUFFER (MUCH BETTER)
  for _, client in pairs(clients) do
    local attached = vim.lsp.buf_is_attached(buffer, client.id)
    if attached then
      return '☰' -- LSP server attached on current buffer
    end
  end
  return '' -- No LSP servers loaded at all
end

-- Recording Status
local function recording()
  local reg = vim.fn.reg_recording()
  if reg == "" then return "" end -- not recording
  return "󰑊 REC @" .. reg
end

-- 'o:encoding': Don't display if encoding is UTF-8.
local encoding = function()
  local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")
  return ret
end

-- 'fileformat': Don't display if &ff is unix.
local fileformat = function()
  local ret, _ = vim.bo.fileformat:gsub("^unix$", "")
  local icons = {
    dos = '', -- e70f
    mac = '', -- e711
    unix = '' -- e712
  }
  return icons[ret] or ret
end

-- HACK: remove ugly white separators due to lualine bugs
local customcat = require 'lualine.themes.catppuccin-macchiato'
customcat.inactive.a.bg = '#282828'


-- ------------------------------------------------------------------------- --
--                               RETURN CONFIG                               --
-- ------------------------------------------------------------------------- --

return {
  'nvim-lualine/lualine.nvim',
  -- For preventing loading of lualine on dashboard
  -- Enabling any events makes bufferline disappear after opening a file from dashboard via fuzzy finding (+8ms)
  -- event = { "BufAdd", "BufNewFile", "BufRead" },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {

    options = {
      theme = customcat,
      icons_enabled = true,
      component_separators = '',
      section_separators = '',
      globalstatus = true,
      refresh = {
        tabline = 100,
        statusline = 300,
        winbar = 300,
      }
    },

    -- +-------------------------------------------------------------------+ --
    -- |  A  |  B  |  C                                     X  |  Y  |  Z  | --
    -- +-------------------------------------------------------------------+ --

    sections = {

      lualine_a = {
        {
          'mode',
          separator = { left = '', right = '' },
          -- fmt = function(str) return str:sub(1,3) end,
          padding = { left = 1, right = 1 }
        },
      },
      lualine_b = {
        { 'branch', separator = { right = '' }, draw_empty = true, },
      },
      lualine_c = {
        {
          'filename',
          path = 1,
          symbols = {
            modified = '[+]',
            readonly = '[-]',
            unnamed = '[No Name]',
            newfile = '[New]',
          }
        },
        { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } },
        '%=',
        'diagnostics',
      },

      lualine_x = {
        fileformat,
        encoding,
        'filetype',
      },
      lualine_y = {
        { 'progress', separator = { left = '' } },
      },
      lualine_z = {
        { 'location', separator = { left = '', right = '' } },
      },

    },

    -- +-------------------------------------------------------------------+ --
    -- |  A  |  B  |  C                                     X  |  Y  |  Z  | --
    -- +-------------------------------------------------------------------+ --

    tabline = {

      lualine_a = {
        { 'searchcount', separator = { left = '', right = '' } },
        {
          recording,
          separator = { left = '', right = '' },
          color = { fg = "white", bg = "red" }
        }
      },
      lualine_b = {
      },
      lualine_c = { 'selectioncount' },
      lualine_x = {},
      lualine_y = {
        { lsp_name, separator = { left = '', }, draw_empty = true },
      },
      lualine_z = {
        -- Returns initial 4 characters of filename because:
        -- I only need a simple visual id for quickly recognizing buffers.
        -- Prevents overflow on long filenames
        {
          'buffers',
          fmt = function(str) return str:sub(1, 4) end,
          use_mode_colors = true,
          symbols = {
            modified = ' ●',
            directory = ' ',
            alternate_file = '',
          },
          -- Source: Nerdfont ple-.*
          separator = { left = '', right = '' },
          component_separators = { right = '' },
          section_separators = { left = '', right = '' },
        },
      }

    },

  },

}
