vim.cmd([[
  function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
  endfunction


  let g:fzf_vim = {}
  let g:fzf_vim.preview_window = []

  let g:fzf_buffers_jump = 1
  let g:fzf_layout = { 'down': '~30%' }

  let g:fzf_action = {
    \ 'ctrl-q': function('s:build_quickfix_list'),
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit' }

  command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
  let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
]])
