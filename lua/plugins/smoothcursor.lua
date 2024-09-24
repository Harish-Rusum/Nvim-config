require('smoothcursor').setup({
    type = "default",
    cursor = " ",
    texthl = "SmoothCursor",
    linehl = nil,

    fancy = {
        enable = true,
        head = { cursor = " ", texthl = "SmoothCursor", linehl = nil },
        body = {
            -- { cursor = "󰝥", texthl = "SmoothCursorRed" },
            -- { cursor = "󰝥", texthl = "SmoothCursorOrange" },
            -- { cursor = "●", texthl = "SmoothCursorYellow" },
            -- { cursor = "●", texthl = "SmoothCursorGreen" },
            -- { cursor = "•", texthl = "SmoothCursorAqua" },
            -- { cursor = ".", texthl = "SmoothCursorBlue" },
            -- { cursor = ".", texthl = "SmoothCursorPurple" },
            { cursor = "󰝥", texthl = "SmoothCursorAqua" },
            { cursor = "󰝥", texthl = "SmoothCursorAqua" },
            { cursor = "●", texthl = "SmoothCursorAqua" },
            { cursor = "●", texthl = "SmoothCursorAqua" },
            { cursor = "•", texthl = "SmoothCursorAqua" },
            { cursor = ".", texthl = "SmoothCursorAqua" },
            { cursor = ".", texthl = "SmoothCursorAqua" },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" }
    },

    matrix = {
        head = {
            cursor = require('smoothcursor.matrix_chars'),
            texthl = {
                'SmoothCursor',
            },
            linehl = nil,
        },
        body = {
            length = 6,
            cursor = require('smoothcursor.matrix_chars'),
            texthl = {
                'SmoothCursorGreen',
            },
        },
        tail = {
            cursor = nil,
            texthl = {
                'SmoothCursor',
            },
        },
        unstop = false,
    },

    autostart = true,
    always_redraw = true,
    flyin_effect = nil,
    speed = 25,
    intervals = 35,
    priority = 10,
    timeout = 3000,
    threshold = 3,
    max_threshold = nil,
    disable_float_win = false,
    enabled_filetypes = nil,
    disabled_filetypes = nil,
    show_last_positions = nil,
})
