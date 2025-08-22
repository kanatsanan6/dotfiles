require('spectre').setup({
  is_insert_mode = true,
  default = {
    find = {
      cmd = "rg",
      options = { "ignore-case" }
    },
    replace = {
      cmd = "sed"
    }
  },
  mapping = {
    ['tab'] = {
      map = ']',
      cmd = "<cmd>lua require('spectre').tab()<cr>",
      desc = 'next query'
    },
    ['shift-tab'] = {
      map = '[',
      cmd = "<cmd>lua require('spectre').tab_shift()<cr>",
      desc = 'previous query'
    },
  },
  open_template = {
    { path = "!db !spec" }
  }
})

vim.keymap.set('n', '<leader>S', function()
  vim.cmd('tabnew')
  require('spectre').toggle()
end, { desc = "Open new tab and toggle Spectre" })

vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})
