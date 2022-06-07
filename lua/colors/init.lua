M={
require("colors.base")
}

for t, o in pairs(M) do
 for c,s  in pairs(o) do

local gui = s["gui"] or "NONE"
local fg= s["fg"] or "NONE"
local bg= s["bg"] or "NONE"

vim.cmd([[highlight]].. " " .. c .. " " .. [[guifg=]]..fg .. " " .. [[guibg=]]..bg .. " " .. [[gui=]]..gui)
 end
end



