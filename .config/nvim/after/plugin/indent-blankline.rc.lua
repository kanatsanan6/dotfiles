require("ibl").setup {
  indent = { char = "▏" },
}

vim.cmd [[autocmd FileType ruby setlocal indentkeys-=.]]
