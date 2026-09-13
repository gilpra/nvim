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
		-- Syntax (Elflord-inspired)
		-- Only used by syntax/Treesitter groups.
		------------------------------------------------------------------

		syntax_comment = "#8EA8D8",
		syntax_constant = "#D38FD0",
		syntax_identifier = "#78D0D0",
		syntax_function = "#F0F0F0",
		syntax_statement = "#CF6666",
		syntax_repeat = "#E0E0E0",
		syntax_type = "#8FD08F",
		syntax_preproc = "#D79AD7",
		syntax_special = "#D96B6B",
		syntax_operator = "#D96B6B",

		------------------------------------------------------------------
		-- Existing semantic colors
		-- Kept unchanged for non-syntax UI/diagnostic components.
		------------------------------------------------------------------

		blue = "#B9D1F2", -- Function
		cyan = "#A9E0D8", -- Constant
		green = "#BDE59F", -- String
		yellow = "#EBD38F", -- Number / Type
		red = "#F0A0A0", -- Error
		purple = "#D5B5E8", -- Keyword

		orange = "#E9B58D",
		teal = "#A0DCD2",
		magenta = "#D5B5E8",
		pink = "#E0B1C8",

		red1 = "#DB9696",
		blue0 = "#AEC8E8",
	}
end

return M
