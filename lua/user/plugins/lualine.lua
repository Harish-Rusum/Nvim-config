local colors = {
    none = "none",
    red = "#ed4e6b",
    lightgrey = "#4a4a49",
    grey = "#3a3b39",
    darkgrey = "#242423",
    green = "#95d982",
    magenta = "#d488f2",
    brown = "#eba871",
    teal = "#3fd1cc",
    white = "#ffffff"
}

local theme = {
    normal = {
        b = { bg = colors.darkgrey, fg = colors.white },
        a = { bg = colors.magenta, fg = colors.darkgrey },
        c = { bg = colors.none, fg = colors.white }
    },
    insert = {
        b = { bg = colors.darkgrey, fg = colors.white },
        a = { bg = colors.red, fg = colors.darkgrey },
        c = { bg = colors.none, fg = colors.white }
    },
    command = {
        b = { bg = colors.darkgrey, fg = colors.white },
        a = { bg = colors.green, fg = colors.darkgrey },
        c = { bg = colors.none, fg = colors.white }
    },
    visual = {
        b = { bg = colors.darkgrey, fg = colors.white },
        a = { bg = colors.brown, fg = colors.darkgrey },
        c = { bg = colors.none, fg = colors.white }
    },
    replace = {
        b = { bg = colors.darkgrey, fg = colors.lightgrey },
        a = { bg = colors.teal, fg = colors.darkgrey },
        c = { bg = colors.none, fg = colors.white }
    }
}

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = theme,
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {'branch', 'diagnostics'},
        lualine_c = {''},
        lualine_x = {
            'filetype',
            {
                function()
                    local clients = vim.lsp.buf_get_clients()
                    local client_names = {}

                    if next(clients) ~= nil then
                        for _, client in pairs(clients) do
                            if client.name ~= 'null-ls' then
                                table.insert(client_names, client.name)
                            end
                        end
                    end

                    local sources = require("null-ls.sources")
                    local ft = vim.bo.filetype
                    local available_sources = sources.get_available(ft)
                    local unique_sources = {}

                    for _, source in ipairs(available_sources) do
                        if not unique_sources[source.name] then
                            table.insert(client_names, source.name)
                            unique_sources[source.name] = true
                        end
                    end

                    if next(client_names) == nil then
                        return ''
                    end

                    return '[' .. table.concat(client_names, ', ') .. ']'
                end,
                icon = ' ',
                color = { fg = '#ffffff', gui = 'bold' }
            }
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
