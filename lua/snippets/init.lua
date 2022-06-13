-- some shorthands...
local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
  history = true,
  updateevents = "TextChanged, TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [require("luasnip.util.types").choiceNode] = {
      activie = {
        virt_text = { { "", "GruvboxOrange" } },
      },
    },
  },
}

ls.add_snippets(nil, {
  all = require "snippets.snips.all",
  -- html = require"snippets.snips.html",
  javascript = require "snippets.snips.javascript",
  typescriptreact = require "snippets.snips.typescipt",
  javascriptreact = require "snippets.snips.javascript",
})

  -- s("div", fmt("<div {}>{}</div>", { i(1), i(2) })),
  -- s("section", fmt("<section {}>{}</section>", { i(1), i(2) })),
  -- s("img", fmt("<img src={} {}/>", { i(1), i(2) })),
  -- s("req", fmt("local {} = require ('{}') {}", { i(1, "default"), rep(1), i(2, "default2") })),

