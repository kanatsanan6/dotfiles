vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.showmode = false
vim.wo.number = true
vim.opt_local.conceallevel = 2
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.title = true
vim.opt.autoindent = false
vim.opt.smartindent = false
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.background = 'dark'
vim.opt.showcmd = true
vim.opt.expandtab = true
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.scrolloff = 12
vim.opt.cmdheight = 1
vim.opt.signcolumn = 'yes'
vim.opt.formatoptions:append { 'r' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.cmd([[
  set statusline=%{expand('%:~:.')}  " Relative path to the file
  set statusline+=%{get(b:,'gitsigns_status','')}
  set statusline+=%=                 " Switch to the right side
  set statusline+=%l                 " Current line
  set statusline+=/%L                " Total lines
  set statusline+=\ %c               " Column number
]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Define a function for Go settings
local function go_settings()
  vim.opt_local.tabstop = 4
  vim.opt_local.shiftwidth = 4
  vim.opt_local.expandtab = true
end

-- Set an autocmd for Go files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = go_settings
})
