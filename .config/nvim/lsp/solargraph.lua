return {
  cmd = { vim.fn.exepath("solargraph"), "stdio" },
  filetypes = { "ruby" },
  root_markers = { "Gemfile", ".git" },
  settings = { solargraph = { diagnostics = false } },
}
-- return {
--   cmd = { "solargraph" },
--   filetypes = { "ruby" },
--   settings = {
--     solargraph = {
--       diagnostics = false,
--     },
--   },
-- }
