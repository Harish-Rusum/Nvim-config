return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()       -- now config is part of the same table
    require("catppuccin").setup({
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      show_end_of_buffer = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
      },
    })
  end
}
