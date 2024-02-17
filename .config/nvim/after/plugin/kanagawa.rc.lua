require('kanagawa').setup({
  background = {    -- map the value of 'background' option to a theme
    dark = "black", -- try "dragon" !
    light = "lotus"
  },
})

vim.cmd("colorscheme kanagawa-dragon")
