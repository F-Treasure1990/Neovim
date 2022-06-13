local ls = require "luasnip"
local s = ls.snippet
local node = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local dyn = ls.dynamic_node --returns snippet node from function

local fmt = require("luasnip.extras.fmt").fmt --format
local rep = require("luasnip.extras").rep --repeat something

local date = function()
  return { os.date "%Y-%m-%d" }
end

local AllSnips = {
  s("clg", {
    t "console.log(",
    i(1, "log"),
    t ")",
  }),
  s({
    trig = "date",
    name = "Date",
    dscr = "Date in the form of YYYY-MM-DD",
  }, {
    f(date, {}),
  }),

  s("myFirstSnippet", { t "Hi This is My First Snippet", i(1, "placeholder"), t { "", "this is another ttext node" } }),
  ls.parser.parse_snippet("lf", "local $1 = function($2)\n $0\nend"),
}

return AllSnips
