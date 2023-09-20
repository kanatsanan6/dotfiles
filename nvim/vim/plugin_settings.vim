" Strip trailing whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_buffers_jump = 1
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_preview_window = []

" vim move
let g:move_key_modifier = 'S'
let g:move_key_modifier_visualmode = 'S'

" vim indent guild
" let g:indent_guides_auto_colors = 1
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
" hi IndentGuidesOdd  ctermbg=black
" hi IndentGuidesEven ctermbg=darkgrey


let g:AutoPairsMapSpace = 0

let g:airline_theme = 'minimalist'

highlight SignColumn guibg=black ctermbg=black
set signcolumn=yes

set statusline=\ %F     " Path to the file
set statusline+=\ %4*%m " Modified flag
set statusline+=%*      " Clear highlight from modified flag
set statusline+=\ %y    " Filetype
set stl+=\ %{FugitiveStatusline()} " Git branch name
set statusline+=%=      " Switch to the right side
set statusline+=%l      " current line
set statusline+=/%L     " Total lines
set statusline+=\ %c    " Column number

" Don't auto-break long lines
autocmd BufNewFile,BufRead * setlocal formatoptions-=t

let g:gitblame_date_format = '%r'
let g:gitblame_message_template = '                      <author> • <date> • <author>'
let g:gitblame_delay = 2000

" nnoremap <Leader>o :lua require("harpoon.ui").toggle_quick_menu()<CR>
" nnoremap <Leader>a :lua require("harpoon.mark").add_file()<CR>
" nnoremap <M-1> :lua require("harpoon.ui").nav_file(1)<CR>
" nnoremap <M-2> :lua require("harpoon.ui").nav_file(2)<CR>
" nnoremap <M-3> :lua require("harpoon.ui").nav_file(3)<CR>
" nnoremap <M-4> :lua require("harpoon.ui").nav_file(4)<CR>

let g:lazygit_floating_window_scaling_factor = 1
