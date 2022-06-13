local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local f = ls.function_node
local p = ls.parser.parse_snippet

local node = ls.snippet_node
local dynamicn = ls.dynamic_node

local fmt = require("luasnip.extras.fmt").fmt --format
local rep = require("luasnip.extras").rep --repeat something

HTMLSnippets = {
	p("a", '<a href="$1" $2>$3</a>$4'),
	p("br", "<br $1>$2</br>$3"),
	p("body", "<body $1>\n $2 \n </body>$3"),
	p("button", "<button $1>$2</button>$3"),
	p("caption", "<caption>$1</caption>$2"),
	p("div", "<div $2>$1</div>$3"),
	p("section", "<section $1>$2</section>$3"),
	p("footer", "<footer $1>$2</footer>$3"),
	p("input", "<input $1/>"),
	p("label", "<label $1>$2</label>$3"),
	p("form", "<form $1> \n $2 \n </form>$3"),
	p("ol", "<ol$1> \n $2 \n </ol>$3"),
	p("ul", "<ul$1> \n $2 \n </ul>$3"),
	p("li", "<li $1>$2</li>$3"),
	p("span", "<span $1>$2</span>$3"),
	p("nav", "<nav$1> \n $2 \n </nav>$3"),
	p("menu", "<menu $1> \n $2 \n </menu>$3"),
	p("p", "<p $1> \n $2 \n </p>$3"),
	p("table", "<table$1> \n $2 \n </table>$3"),

	p("h1", "<h1 $1>$2</h1>$3"),
	p("h2", "<h2 $1>$2</h2>$3"),
	p("h3", "<h3 $1>$2</h3>$3"),
	p("h4", "<h4 $1>$2</h4>$3"),
	p("h5", "<h5 $1>$2</h5>$3"),
	p("h6", "<h6 $1>$2</h6>$3"),
}

local MergeSnips = {}

for _, table in ipairs({ HTMLSnippets }) do
	for _, value in ipairs(table) do
		MergeSnips[#MergeSnips + 1] = value
	end
end

return MergeSnips
