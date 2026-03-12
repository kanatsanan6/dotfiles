local ruby_lsp_cmd = vim.fn.exepath("ruby-lsp")

if ruby_lsp_cmd == "" then
  ruby_lsp_cmd = "ruby-lsp"
end

return {
  cmd = { ruby_lsp_cmd },
  filetypes = { "ruby", "eruby" },
  root_markers = { "Gemfile", ".git" },
  init_options = {
    formatter = "auto",
  },
}
