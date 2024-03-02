-- Quick access to a local notes file for keeping track of things in a given
-- project. Add `.project-notes` to global ~/.gitignore

local project_notes_file = ".project-notes"

-- Function to smartly split the window and open the project notes
local function smart_split(file)
  local split_cmd = vim.fn.winwidth(0) >= 100 and "vsplit" or "split"
  vim.cmd(split_cmd .. " " .. file)
end

-- Command to edit project notes, calling the smart_split function
vim.api.nvim_create_user_command('EditProjectNotes', function()
  smart_split(project_notes_file)
end, {})

-- Mapping for quick access to editing project notes
vim.api.nvim_set_keymap('n', '<leader>ep', ':EditProjectNotes<CR>', { noremap = true, silent = true })

-- Auto command to set up the notes buffer when entering the project notes file
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = project_notes_file,
  callback = function()
    vim.bo.filetype = "markdown"
    -- Corrected the parameters for nvim_buf_set_keymap
    vim.api.nvim_buf_set_keymap(0, 'n', 'q', ':wq<CR>', { noremap = true, silent = true })
  end
})
