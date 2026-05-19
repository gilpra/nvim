local M = {}

M.get = function()
	return {
		------------------------------------------------------------------
		-- UI (Monochrome)
		------------------------------------------------------------------

		bg = "#181818",
		bg_dark = "#141414",
		bg_highlight = "#202020",

		fg = "#E8E8E8",
		comment = "#7A7A7A",

		selection = "#303030",

		white = "#FFFFFF",
		light = "#D8D8D8",
		muted = "#B8B8B8",
		dim = "#8A8A8A",

		------------------------------------------------------------------
		-- Syntax (Soft Colors)
		------------------------------------------------------------------

		blue = "#AFC6E9", -- Function
		cyan = "#A8D5CF", -- Constant
		green = "#B7D7A8", -- String
		yellow = "#D9C79B", -- Number / Type
		red = "#D8A6A6", -- Error
		purple = "#C9B3D9", -- Keyword

		orange = "#D8B89C",
		teal = "#9EC8C3",
		magenta = "#C9B3D9",
		pink = "#D7B6C6",

		red1 = "#C98E8E",
		blue0 = "#9EBAD8",
	}
end

return M
