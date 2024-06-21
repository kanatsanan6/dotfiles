local keymap = vim.keymap
local opts = { silent = true }

vim.cmd([[
  let g:fzf_checkout_git_options = '--sort=-committerdate'
]])

vim.g.mapleader = " "

-- filetype
keymap.set('n', '<leader>ft', ':set filetype=ruby<CR>', { silent = true })

-- tmux
keymap.set('n', '<M-h>', ':TmuxNavigateLeft<cr>', { silent = true })
keymap.set('n', '<M-j>', ':TmuxNavigateDown<cr>', { silent = true })
keymap.set('n', '<M-k>', ':TmuxNavigateUp<cr>', { silent = true })
keymap.set('n', '<M-l>', ':TmuxNavigateRight<cr>', { silent = true })

-- page down and page up to be auto-centered
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- keep cursor on yank
keymap.set('x', 'y', 'mcy`c')

-- Easier % to jump between matching brackets
keymap.set('n', '<C-b>', '%')

-- buffer navigation
keymap.set("n", "<S-k>", ":bnext<CR>", opts)
keymap.set("n", "<S-j>", ":bprevious<CR>", opts)

-- vim-test ruby on rails (rspec)
keymap.set('n', '<leader>v', ':TestVisit<CR>')
keymap.set('n', '<leader>t', ':TestNearest -strategy=neovim<CR>')
keymap.set('n', '<leader>T', ':TestFile -strategy=neovim<CR>')
keymap.set('n', '<leader>o', ':A<CR>', { silent = true })

-- Open notes
keymap.set('n', '<leader>n', '<C-w>v:e ~/notes<CR>')

-- quick fix navigation
keymap.set('n', '<M-n>', ':cn<CR>')
keymap.set('n', '<M-p>', ':cp<CR>')
keymap.set('n', '<M-q>', ':ccl<CR>')

-- zenmode
keymap.set('n', '<leader>z', ':ZenMode<CR>')

-- replace hightlighted word
keymap.set("x", "<leader>p", [["_dP]])

-- copy to clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- clear search hightlighted
keymap.set("n", "<ESC>", ":noh<CR>", { silent = true })

keymap.set("n", "<leader>g", ":LazyGit<CR>", { silent = true })

-- tab
-- Tab keybinds
-- Go to tab number
-- keymap.set('n', '<Leader>1', '<CMD>tabnext1<CR>')
-- keymap.set('n', '<Leader>2', '<CMD>tabnext2<CR>')
-- keymap.set('n', '<Leader>3', '<CMD>tabnext3<CR>')
-- keymap.set('n', '<Leader>4', '<CMD>tabnext4<CR>')
-- keymap.set('n', '<Leader>5', '<CMD>tabnext5<CR>')
-- keymap.set('n', '<Leader>6', '<CMD>tabnext6<CR>')
-- keymap.set('n', '<Leader>7', '<CMD>tabnext7<CR>')
-- keymap.set('n', '<Leader>8', '<CMD>tabnext8<CR>')
-- keymap.set('n', '<Leader>9', '<CMD>tabnext9<CR>')

-- Previous/next tab
keymap.set('n', '<S-Tab>', '<CMD>tabprevious<CR>')
keymap.set('n', '<Tab>', '<CMD>tabnext<CR>')

-- Move current tab
keymap.set('n', '[T', '<CMD>tabmove -1<CR>')
keymap.set('n', ']T', '<CMD>tabmove +1<CR>')

-- Close tab
keymap.set('n', '<Leader>x', '<CMD>tabclose<CR>')
keymap.set('n', '<Leader>X', '<CMD>tabclose!<CR>')

-- Don't leave visual mode after indenting
keymap.set('v', '>', '>gv^')
keymap.set('v', '<', '<gv^')

-- Make J and K move selected lines up and down
keymap.set('v', '<M-j>', [[:move '>+1<CR>gv=gv]], { silent = true })
keymap.set('v', '<M-k>', [[:move '<-2<CR>gv=gv]], { silent = true })

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- New tab
keymap.set('n', 'te', ':tabedit<CR>')
-- Split window
keymap.set('n', 'sh', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'ss', ':vsplit<Return><C-w>w', { silent = true })

-- Move window
keymap.set('n', '\\', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- custom Ag
vim.cmd([[
  command! -bang -nargs=* AgExcludeTest call fzf#vim#ag(<q-args>, '--ignore spec', fzf#vim#with_preview(), <bang>0)
  command! -bang -nargs=* AgOnlyTest call fzf#vim#ag(<q-args>, '--ignore spec', fzf#vim#with_preview(), <bang>0)
]])

-- fzf
keymap.set('n', '<C-p>', ':Files<CR>', { silent = true })
keymap.set('n', '<leader>L', ':Lines<cr>', { silent = true })
keymap.set('n', '<leader>r', ':Ag<cr>', { silent = true })
keymap.set('n', '<leader>R', ':AgExcludeTest<cr>', { silent = true })
keymap.set('n', '<leader>Q', ':AgOnlyTest<cr>', { silent = true })
keymap.set('n', "<leader>\\", ':Lines<cr>', { silent = true })

vim.cmd([[
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

  noremap <silent> <leader>o :ToggleSpecFile<CR>

    " "Aliases" for commonly used commands+lazy shift finger:
  command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
  command! -bar -nargs=* -complete=file -range=% -bang Write     <line1>,<line2>write<bang> <args>
  command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
  command! -bar                                  -bang Wqall     wqa<bang>
  command! -bar -nargs=* -complete=file -range=% -bang We        <line1>,<line2>w<bang> | e <args>
  command! -bar -nargs=* -complete=file -count   -bang Wnext     <count>wnext<bang> <args>
  command! -bar -nargs=* -complete=file -count   -bang Wprevious <count>wprevious<bang> <args>
  command! -bar -nargs=* -complete=file          -bang E         edit<bang> <args>
  command! -bar -nargs=* -complete=file          -bang Edit      edit<bang> <args>
  command! -bar                                  -bang Q         quit<bang>
  command! -bar                                  -bang Quit      quit<bang>
  command! -bar                                  -bang Qall      qall<bang>
  command! -bar -nargs=? -complete=option              Set       set <args>
  command! -bar -nargs=? -complete=help                Help      help <args>
  command! -bar -nargs=* -complete=file          -bang Make      make<bang> <args>
  command! -bar -nargs=* -complete=buffer        -bang Bdel      bdel<bang> <args>
  command! -bar -nargs=* -complete=buffer        -bang Bwipe     bwipe<bang> <args>
  command! -bar -nargs=* -complete=file          -bang Mksession mksession<bang> <args>
  command! -bar -nargs=* -complete=dir           -bang Cd        cd<bang> <args>
  command! -bar                                        Messages  messages
  command! -bar -nargs=+ -complete=file          -bang Source    source<bang> <args>
]])

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- undotree
vim.keymap.set('n', '<leader>d', vim.cmd.UndotreeToggle)
