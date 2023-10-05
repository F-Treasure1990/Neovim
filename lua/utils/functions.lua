local c = require("utils.colors")

function HLS(highlight_table)
  for hl, col in pairs(highlight_table) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

P = function(v)
	print(vim.inspect(v))
	return v
end

return {
  HLS = HLS
}
