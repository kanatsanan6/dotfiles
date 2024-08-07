vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]]

vim.g.accent_darken = 1
vim.g.accent_invert_status = 1
vim.g.accent_no_bg = 1
vim.g.accent_colour = 'yellow'

vim.cmd [[
  augroup MyColors
      autocmd!
      autocmd ColorScheme * highlight StatusLine cterm=NONE guibg=#808080 guifg=#000000
  augroup END
]]

vim.cmd.colorscheme("accent")
