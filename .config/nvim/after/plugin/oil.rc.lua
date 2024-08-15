require("oil").setup({
  use_default_keymaps = false,
  delete_to_trash = true,
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
    is_always_hidden = function(name, bufnr)
      local always_hidden = { ".git", ".vscode", ".idea" }

      for _, value in pairs(always_hidden) do
        if value == name then return true end
      end

      return false
    end,
  },
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-s>"] = "actions.select_vsplit",
    ["<C-t>"] = "actions.select_tab",
    ["<C-o>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash",
  },
})
