local keymap = vim.keymap
local func = require('function')
local opts = { silent = true }

vim.cmd([[
  let g:fzf_checkout_git_options = '--sort=-committerdate'
]])

vim.g.mapleader = " "

-- tmux
keymap.set('n', '<M-h>', ':TmuxNavigateLeft<cr>', opts)
keymap.set('n', '<M-j>', ':TmuxNavigateDown<cr>', opts)
keymap.set('n', '<M-k>', ':TmuxNavigateUp<cr>', opts)
keymap.set('n', '<M-l>', ':TmuxNavigateRight<cr>', opts)

-- git
keymap.set('n', '<leader>gg', ':LazyGit <cr>', opts)

-- page down and page up to be auto-centered
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- keep cursor on yank
keymap.set('x', 'y', 'mcy`c')

-- Easier % to jump between matching brackets
keymap.set('n', '<C-b>', '%')

-- vim-test ruby on rails (rspec)
keymap.set('n', '<leader>v', ':TestVisit<CR>')
keymap.set('n', '<leader>t', ':TestNearest<CR>')
keymap.set('n', '<leader>T', ':TestFile<CR>')
keymap.set('n', '<leader>o', func.toggleSpec, opts)

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
keymap.set("n", "<ESC>", ":noh<CR>", opts)

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
keymap.set('v', '<M-j>', [[:move '>+1<CR>gv=gv]], opts)
keymap.set('v', '<M-k>', [[:move '<-2<CR>gv=gv]], opts)

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- New tab
keymap.set('n', 'te', ':tabedit<CR>')
-- Split window
keymap.set('n', 'sh', ':split<Return><C-w>w', opts)
keymap.set('n', 'ss', ':vsplit<Return><C-w>w', opts)

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
  command! -bang -nargs=* Files call fzf#vim#files(<q-args>, {'options': ['-i']}, <bang>0)
]])

-- fzf
keymap.set('n', '<C-p>', ':Files<CR>', opts)
keymap.set('n', '<leader>L', ':Lines<cr>', opts)
keymap.set('n', '<leader>r', ':Ag<cr>', opts)
keymap.set('n', '<leader>R', ':AgExcludeTest<cr>', opts)
keymap.set('n', '<leader>Q', ':AgOnlyTest<cr>', opts)
keymap.set('n', "<leader>\\", ':Lines<cr>', opts)

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.cmd([[
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
