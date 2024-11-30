local git_blame = require('gitblame')

git_blame.setup({
  enabled = false,
})

vim.g.gitblame_use_blame_commit_file_urls = true
vim.g.gitblame_message_template = '<date> | <author> | <summary>'
vim.g.gitblame_date_format = '%r'

vim.keymap.set('n', '<leader>b', ':GitBlameToggle<CR>', { silent = true })

-- make git blame works with cursorline
vim.g.gitblame_set_extmark_options = {
  hl_mode = "combine",
}
