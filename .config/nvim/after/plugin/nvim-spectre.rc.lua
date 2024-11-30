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
  }
})

vim.keymap.set('n', '<leader>S', function()
  vim.cmd('tabnew')
  require('spectre').toggle()
end, { desc = "Open new tab and toggle Spectre" })
