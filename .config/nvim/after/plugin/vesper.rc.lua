local colors = require("vesper.colors")

require('vesper').setup({
  transparent = false,
  italics = {
    comments = false,
    keywords = false,
    functions = false,
    strings = false,
    variables = false,
  },
  overrides = {},
  palette_overrides = {
    green = colors.redDark,
    greenLight = colors.redDark,
  }
})

vim.cmd.colorscheme('vesper')
