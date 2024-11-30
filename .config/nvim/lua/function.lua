local M = {}

local function isSpec(path)
  if string.find(path, "_spec%.rb$") then
    return true
  end

  return false
end

local function openFile(path)
  if vim.fn.winnr("$") > 1 then
    vim.cmd([[wincmd w]]) -- TODO: refactor to use native lua
    vim.api.nvim_command("edit " .. path)
  else
    vim.api.nvim_command("vsplit " .. path)
  end
end

M.toggleSpec = function()
  local curr_file = vim.api.nvim_buf_get_name(0)
  local dest_file = ""

  if isSpec(curr_file) then
    dest_file = string.gsub(curr_file, "/spec/", "/app/")
    dest_file = string.gsub(dest_file, "_spec%.rb$", ".rb")
  else
    dest_file = string.gsub(curr_file, "/app/", "/spec/")
    dest_file = string.gsub(dest_file, "%.rb$", "_spec%.rb")
  end

  openFile(dest_file)
end

return M
