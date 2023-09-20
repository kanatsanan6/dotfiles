" vim-test ruby on rails (rspec)
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <Leader>rn :call RenameFile()<cr>map <silent> <leader>o :A<CR>

" fzf
nnoremap <silent> <C-p> :Files<CR>
nnoremap <leader>L :Lines<cr>
nnoremap <enter> :Buffers<cr>
nnoremap <silent> <leader>R :Ag<cr>
nnoremap <silent> \ :Lines<cr>

command! E Explore

" tyru/open-browser.vim
nnoremap <silent> <leader>ch :OpenBrowser https://google.com<CR>

" Rename current file
map <Leader>rn :call RenameFile()<cr>

" Lazy git
nnoremap <silent> <leader>gg :LazyGit<CR>

" search google
nnoremap <leader>? :call Goog(input("Google Search: "), 0)<CR>

" tab navigation (with leader + number)
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt

nnoremap <M-e> :E<CR>
nnoremap <C-e> :e .<CR>

" Open github
nnoremap <silent> <leader>gh :OpenGithubPullReq<CR>

" Switch between last two buffers
nnoremap <leader><tab> <C-^>

nnoremap <leader>nt :Files ~/Notes<cr>

command! -nargs=1 TouchEdit :execute '!touch ' . <q-args> | :edit <args>

" nnoremap <leader>t :TouchEdit<space>

function! ToggleSpec()
  let current_file = expand('%:p')
  let destination_file = ""

  " Check if current file is a spec
  if current_file =~ "_spec\.rb$"
    " Convert spec path to main file path
    let destination_file = substitute(current_file, "/spec/", "/app/", "")
    let destination_file = substitute(destination_file, "_spec\.rb$", ".rb", "")
  else
    " Convert main file path to spec path
    let destination_file = substitute(current_file, "/app/", "/spec/", "")
    let destination_file = substitute(destination_file, "\.rb$", "_spec.rb", "")
  endif

  " Check if the destination file exists
  if filereadable(destination_file)
    " If more than one window is open, switch to the other split and edit. Otherwise, do a vertical split.
    if winnr('$') > 1
      wincmd w
      execute "edit " . destination_file
    else
      execute "vsplit " . destination_file
    endif
  else
    " Offer to create it if it doesn't exist
    let answer = input("File does not exist. Create it? (y/n) ")
    if answer == 'y'
      execute "!touch " . destination_file
      " Again, decide how to open based on window count
      if winnr('$') > 1
        wincmd w
        execute "edit " . destination_file
      else
        execute "vsplit " . destination_file
      endif
    endif
  endif
endfunction

" Define the custom Vim command
command! ToggleSpecFile :call ToggleSpec()

" Bind the command to <leader>t (assuming you've set your mapleader)
noremap <silent> <leader>o :ToggleSpecFile<CR>
