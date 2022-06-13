local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

local node = ls.snippet_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

 JavaScriotSnippets = {
  s("snip", { t "javascript snippet" }),
}

local SnippetTables = { JavaScriotSnippets } -- tables to merge
local MergeSnips = {}

for _, table in ipairs(SnippetTables) do
  for _, value in ipairs(table) do
    MergeSnips[#MergeSnips + 1] = value
  end
end

return MergeSnips
