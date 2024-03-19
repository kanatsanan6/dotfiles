require("ibl").setup {
  indent = { char = "▏" },
  scope = { enabled = false },
}

vim.cmd [[autocmd FileType ruby setlocal indentkeys-=.]]
