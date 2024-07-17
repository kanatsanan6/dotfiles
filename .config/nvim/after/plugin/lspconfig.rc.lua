local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end
end

local cmd = vim.cmd
local lsp = vim.lsp
local map = vim.keymap.set
local opt_local = vim.opt_local

-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  cmd([[LspStop]])
  return
end

local nvim_lsp = require("lspconfig")
local nvim_lsp_windows = require("lspconfig.ui.windows")

-- Custom on attach function.
local lsp_on_attach = function()
  -- Disable LSP for files larger than 100KB.
  -- Mappings.
  local opts = { buffer = true }
  map("n", "ga", lsp.buf.code_action, opts)
  map("n", "gd", lsp.buf.definition, opts)
  map("n", "K", lsp.buf.hover, opts)
  map("n", "gr", lsp.buf.references, opts)
  map("n", "gR", lsp.buf.rename, opts)
  map("i", "<C-k>", lsp.buf.signature_help, opts)

  opt_local.omnifunc = ""
  opt_local.formatexpr = ""
end

-- Global mappings.
map("n", "'r", ":LspRestart<CR>", { silent = true })

-- Add border to LSP windows such as `:LspInfo`.
nvim_lsp_windows.default_options.border = "single"

-- Custom on attach function which disables formatting where ALE will instead
-- be used to format.
local lsp_on_attach_no_formatting = function(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  lsp_on_attach()
end

-- Custom on attach function which disable LSP semantic highlighting.
-- local lsp_on_attach_no_semantic_highlights = function(client)
--   client.server_capabilities.semanticTokensProvider = nil
-- end

-- gem install solargraph
-- solargraph clear
-- solargraph download-core
-- solargraph bundle
nvim_lsp.solargraph.setup({
  on_attach = lsp_on_attach_no_formatting, -- Use standardrb for formatting
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  single_file_support = true, -- Allow LSP to work in standalone Ruby scripts
  settings = { solargraph = { diagnostics = false } },
})

-- gem install standard
nvim_lsp.standardrb.setup({
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
})

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  cmd = { "/Users/kanatsananj/go/bin/gopls" }
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.tailwindcss.setup {}

nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },

      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
}

vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
