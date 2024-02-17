local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})

local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')

npairs.add_rules({
  Rule("$$", "$$", "tex")
      :with_pair(cond.not_before_text(''))
      :with_pair(cond.not_after_text(''))
}
)
