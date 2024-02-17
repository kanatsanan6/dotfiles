require("zen-mode").setup({
  window = {
    options = {
      number = true,
      relativenumber = true,
    }
  },
  plugins = {
    options = {
      laststatus = 3
    },
    tmux = { enabled = false }
  }
})
