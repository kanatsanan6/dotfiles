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

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre"
})

vim.keymap.set('n', '<leader>sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file"
})
