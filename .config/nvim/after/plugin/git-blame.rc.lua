local git_blame = require('gitblame')

git_blame.setup({
  enabled = false,
})

vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
vim.g.gitblame_message_template = '<date> | <author> | <summary>'
vim.g.gitblame_date_format = '%r'       -- %r  relative date (e.g., 3 days ago)
vim.g.gitblame_delay = 1000

vim.keymap.set('n', '<leader>b', ':GitBlameToggle<CR>', { silent = true })

-- make git blame works with cursorline
vim.g.gitblame_set_extmark_options = {
  hl_mode = "combine",
}
