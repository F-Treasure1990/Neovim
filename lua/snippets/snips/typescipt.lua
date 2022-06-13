local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local p = ls.parser.parse_snippet

local node = ls.snippet_node
local func = ls.function_node
local c = ls.choice_node
local dynamicn = ls.dynamic_node

local fmt = require("luasnip.extras.fmt").fmt --format
--imported languages
local JavascriptSnips = require("snippets.snips.javascript")
local HTMLSnips = require("snippets.snips.html")

local TypescriptSnips = {
	p("imp", 'import $1 from "$2"'),
	-- INTERFACE
	s(
		"@interface",
		fmt(
			[[ 
  interface {} {{
    {}
  }}
    ]],
			{
				i(1, ""),
				i(2, ""),
			}
		)
	),
}

local SnippetTables = { TypescriptSnips, JavascriptSnips, HTMLSnips } -- tables to merge
local MergeSnips = {}

for _, table in ipairs(SnippetTables) do
	for _, value in ipairs(table) do
		MergeSnips[#MergeSnips + 1] = value
	end
end

return MergeSnips
