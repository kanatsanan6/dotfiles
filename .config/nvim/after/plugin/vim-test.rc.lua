vim.cmd([[
  let g:test#neovim#start_normal = 1
  let test#neovim#term_position = "bot 15"
  let test#strategy = {
      \ 'nearest': 'neovim',
      \ 'file':    'neovim'
      \}
]])
