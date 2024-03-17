local opts = { noremap = true, silent = false }

require("zk").setup({
  picker = "fzf",
  lsp = {
    config = {
      cmd = { "zk", "lsp" },
      name = "zk",
    },
  },

  -- Create a new note after asking for its title.
  vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts),

  -- Open notes.
  vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
})
