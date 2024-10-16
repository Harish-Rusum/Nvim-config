-- PERF: setting up a seperate plugin for a floating terminal 

require('FTerm').setup({
    border = 'rounded',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})
