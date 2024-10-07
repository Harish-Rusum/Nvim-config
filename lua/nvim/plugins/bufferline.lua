-- PERF: setting up bufferline (list of tabs at the top)

require("bufferline").setup {
  options = {
    indicator_icon = '▎',
    modified_icon = '●',
    persist_buffer_sort = true,
    always_show_bufferline = true,
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "center",
        separator = true,
      }
    },
  },
}
