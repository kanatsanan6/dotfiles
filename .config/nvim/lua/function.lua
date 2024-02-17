local function copy_file_path(mode)
  local path
  if mode == "full" then
    path = vim.fn.expand('%:p')
  elseif mode == "relative" then
    local full_path = vim.fn.expand('%:p')
    local project_root = vim.fn.getcwd()
    path = vim.fn.fnamemodify(full_path, ':.:' .. project_root)
  else
    print("Invalid mode specified. Use 'full' or 'relative'.")
    return
  end

  vim.fn.setreg('+', path)

  print('Copied ' .. mode .. ' path: ' .. path)
end

_G.copy_full_path = function() copy_file_path("full") end
