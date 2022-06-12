local alpha_status_ok, alpha = pcall(require, "alpha")
if not alpha_status_ok then
	print("autopairs not found : autopairs.lua")
end
local dashboard = require("alpha.themes.dashboard")
math.randomseed(os.time())

local function pick_color()
	local colors = { "String", "Identifier", "Keyword", "Number", "Type" }
	return colors[math.random(#colors)]
end

local function footerFunc()
	local total_plugins = #vim.tbl_keys(packer_plugins)
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

	return "  " .. total_plugins .. " plugins" .. nvim_version_info
end
local buttonhl = function(shortcut, text, command, hl)
    local button = dashboard.button(shortcut, text, command)
    button.opts.hl_shortcut = hl
    return button
end

local logo = {
	type = "text",
	val = {
		"            :h-                                  Nhy`               ",
		"           -mh.                           h.    `Ndho               ",
		"           hmh+                          oNm.   oNdhh               ",
		"          `Nmhd`                        /NNmd  /NNhhd               ",
		"          -NNhhy                      `hMNmmm`+NNdhhh               ",
		"          .NNmhhs              ```....`..-:/./mNdhhh+               ",
		"           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
		"           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
		"      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
		" .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
		" h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
		" hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
		" /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
		"  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
		"   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
		"     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
		"       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
		"       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
		"       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
		"       //+++//++++++////+++///::--                 .::::-------::   ",
		"       :/++++///////////++++//////.                -:/:----::../-   ",
		"       -/++++//++///+//////////////               .::::---:::-.+`   ",
		"       `////////////////////////////:.            --::-----...-/    ",
		"        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
		"         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
		"           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
		"            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
		"           s-`::--:::------:////----:---.-:::...-.....`./:          ",
		"          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
		"         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
		"        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
		"                        .-:mNdhh:.......--::::-`                    ",
		"                           yNh/..------..`                          ",
		"                                                                    ",
	},
	opts = {
		hl = "Identifier",
		position = "center",
	},
}
-- use like this
dashboard.section.buttons.val = {
    buttonhl("n", "  New file", ":enew ", "NonText"),
    ...
}
local buttons = {
	type = "group",
	val = {
		buttonhl("L-ff", "  File Explorer", "", "Identifier"),
		buttonhl("L-fo", "  Recent Files", "", "Identifier"),
		buttonhl("L-fw", "  Find Word", "", "Identifier"),
		buttonhl("L-ps", "  Update plugins", "", "Identifier"),
		buttonhl("q", "  Quit", ":qa<cr>",  "Identifier"),
	},
	opts = {
	  spacing = 1,
	  hl = "Identifier",
	  position = "center"
	}
}

local footer = {
	type = "text",
	val = footerFunc(),
	opts = {
		hl = "Identifier",
		position = "center",
	},
}

local opts = {
	layout = {
		{ type = "padding", val = 2 },
		logo,
		{ type = "padding", val = 2 },
		buttons,
		{ type = "padding", val = 2 },
		footer,
	},
	opts = {
		margin = 5,
	}
}

--[[ dashboard.section.header.val = logo
dashboard.section.header.opts.hl = pick_color()

dashboard.section.buttons.val = {
	dashboard.button("ff", "  File Explorer"),
	dashboard.button("L-fo", "  Find File"),
	dashboard.button("L-fw", "  Find Word"),
	dashboard.button("L-ps", "  Update plugins"),
	dashboard.button("q", "  Quit", ":qa<cr>"),
}
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Keyword" ]]

vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])

alpha.setup(opts)
