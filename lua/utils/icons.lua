--   פּ ﯟ   some other good icons
local kinds = {
	Function = " ",
  Table = " ",
  Boolean = " ",
  Field = "󰜢 ",
  Tag = " ",
  Constructor = " ",
	Class = " ",
	Module = " ",
	Number = " ",
	Color = " ",
	Folder = " ",
	Constant = " ",
	cmp_tabnine = "ﮧ",
	luasnip = " ",
	path = "λ ",
	Array = " ",
	buffer = "Ω ",
	File = " ",
	EnumMember = " ",
	Enum = " ",
	Event = " ",
	Key = " ",
	Interface = " ",
	Keyword = " ",
	Method = " ",
	Namespace = " ",
	Null = "󰟢 ",
  Object = "󰅩 ",
	Operator = " ",
	Package = " ",
	Reference = " ",
	Property = " ",
	Snippet = " ",
	String = " ",
	Text = " ",
	Struct = " ",
	TypeParameter = " ",
	Unit = " ",
	Value = " ",
	Variable = " ",
	TabNine = " ",
	Copilot = " ",
	Codeium = " ",
	Watch = "󰥔 ",

	NewFile = " ",
	Note = " ",
	SignOut = " ",
	Search = " ",
	Target = "󰀘 ",
	Telescope = " ",
	Tree = " ",
	Tab = " ",
}

local git = {
	LineAdded = "",
	LineModified = "",
	LineRemoved = "",
	FileDeleted = "",
	FileIgnored = "◌",
	FileRenamed = "",
	FileStaged = "S",
	FileUnmerged = "",
	FileUnstaged = "",
	FileUntracked = "U",
	Diff = "",
	Repo = "",
	Octoface = "",
	Branch = "",
}
local ui = {
	ArrowCircleDown = "",
	ArrowCircleLeft = "",
	ArrowCircleRight = "",
	ArrowCircleUp = "",
	BoldArrowDown = "",
	BoldArrowLeft = "",
	BoldArrowRight = "",
	BoldArrowUp = "",
	BoldClose = "",
	BoldDividerLeft = "",
	BoldDividerRight = "",
	BoldLineLeft = "▎",
	BookMark = "",
	BoxChecked = "",
	Bug = "",
	Stacks = "",
	Scopes = "",
	Watches = "",
	DebugConsole = "",
	Calendar = "",
	Check = "",
	ChevronRight = ">",
	ChevronShortDown = "",
	ChevronShortLeft = "",
	ChevronShortRight = "",
	ChevronShortUp = "",
	Circle = "",
	Close = "",
	CloudDownload = "",
	Code = "",
	Comment = "",
	Dashboard = "",
	DividerLeft = "",
	DividerRight = "",
	DoubleChevronRight = "»",
	Ellipsis = "",
	EmptyFolder = "",
	EmptyFolderOpen = "",
	File = "",
	FileSymlink = "",
	Files = "",
	FindFile = "",
	FindText = "",
	Fire = "",
	Folder = "",
	FolderOpen = "",
	FolderSymlink = "",
	Forward = "",
	Gear = "",
	History = "",
	Lightbulb = "",
	LineLeft = "▏",
	LineMiddle = "│",
	List = "",
	Lock = "",
	NewFile = "",
	Note = "",
	Package = "",
	Pencil = "",
	Plus = "",
	Project = "",
	Search = "",
	SignIn = "",
	SignOut = "",
	Tab = "",
	Table = "",
	Target = "󰀘",
	Telescope = "",
	Text = "",
	Tree = "",
	Triangle = "契",
	TriangleShortArrowDown = "",
	TriangleShortArrowLeft = "",
	TriangleShortArrowRight = "",
	TriangleShortArrowUp = "",
}

local diagnostics = {
	BoldError = "",
	Error = "",
	BoldWarning = "",
	Warning = "",
	BoldInformation = "",
	Information = "",
	BoldQuestion = "",
	Question = "",
	BoldHint = "",
	Hint = "",
	Debug = "",
	Trace = "✎",
}

local misc = {
	Robot = "ﮧ",
	Squirrel = "",
	Tag = "",
	Watch = "",
	Smiley = "",
	Package = "",
	CircuitBoard = "",
}

local evicons = {
	default_icon = {
		icon = "󰈚",
		name = "Default",
	},

	c = {
		icon = "",
		name = "c",
	},

	css = {
		icon = "",
		name = "css",
	},

	deb = {
		icon = "",
		name = "deb",
	},

	Dockerfile = {
		icon = "",
		name = "Dockerfile",
	},

	html = {
		icon = "",
		name = "html",
	},

	jpeg = {
		icon = "󰉏",
		name = "jpeg",
	},

	jpg = {
		icon = "󰉏",
		name = "jpg",
	},

	js = {
		icon = "󰌞",
		name = "js",
	},

	kt = {
		icon = "󱈙",
		name = "kt",
	},

	lock = {
		icon = "󰌾",
		name = "lock",
	},

	lua = {
		icon = "",
		name = "lua",
	},

	mp3 = {
		icon = "󰎆",
		name = "mp3",
	},

	mp4 = {
		icon = "",
		name = "mp4",
	},

	out = {
		icon = "",
		name = "out",
	},

	png = {
		icon = "󰉏",
		name = "png",
	},

	py = {
		icon = "",
		name = "py",
	},

	["robots.txt"] = {
		icon = "󰚩",
		name = "robots",
	},

	toml = {
		icon = "",
		name = "toml",
	},

	ts = {
		icon = "󰛦",
		name = "ts",
	},

	ttf = {
		icon = "",
		name = "TrueTypeFont",
	},

	rb = {
		icon = "",
		name = "rb",
	},

	rpm = {
		icon = "",
		name = "rpm",
	},

	vue = {
		icon = "󰡄",
		name = "vue",
	},

	woff = {
		icon = "",
		name = "WebOpenFontFormat",
	},

	woff2 = {
		icon = "",
		name = "WebOpenFontFormat2",
	},

	xz = {
		icon = "",
		name = "xz",
	},

	zip = {
		icon = "",
		name = "zip",
	},
}

return {
	kinds = kinds,
}
