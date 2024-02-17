-- require("ibl").setup {
--   indent = { char = "." },
--   whitespace = {
--     remove_blankline_trail = false,
--   },
--   scope = { enabled = false },
-- }

vim.cmd [[autocmd FileType ruby setlocal indentkeys-=.]]
