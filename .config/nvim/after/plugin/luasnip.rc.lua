local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.add_snippets("ruby", {
  s("frozen", {
    t("# frozen_string_literal: true")
  }),
  s("itis", {
    t("it { is_expected.to "), i(1), t( " }")
  }),
  s("pry", {
    t("binding.pry")
  }),
})
