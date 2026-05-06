local M = {}

M.get = function(c)
	return {
		Normal = { fg = c.fg, bg = c.bg },
		NormalNC = { fg = c.fg, bg = c.bg }, -- window tidak aktif
		CursorLine = { bg = c.bg_highlight },
		CursorColumn = { bg = c.bg_highlight },
		LineNr = { fg = c.comment },
		CursorLineNr = { fg = c.yellow },
		Visual = { bg = c.selection },
		VisualNOS = { bg = c.selection },

		SignColumn = { fg = c.comment, bg = c.bg },

		WinSeparator = { fg = c.bg_highlight, bg = c.bg },

		Folded = { fg = c.comment, bg = c.bg_highlight },
		FoldColumn = { fg = c.comment, bg = c.bg },

		Search = { fg = c.bg, bg = c.yellow },
		IncSearch = { fg = c.bg, bg = c.yellow }, -- highlight aktif saat mengetik
		CurSearch = { fg = c.bg, bg = c.yellow },

		Cursor = { fg = c.bg, bg = c.fg },
		CursorIM = { fg = c.bg, bg = c.fg },

		StatusLine = { fg = c.fg, bg = c.bg_dark },
		StatusLineNC = { fg = c.comment, bg = c.bg_dark },

		TabLine = { fg = c.comment, bg = c.bg_dark },
		TabLineFill = { fg = c.comment, bg = c.bg_dark },
		TabLineSel = { fg = c.fg, bg = c.bg_highlight },

		NormalFloat = { fg = c.fg, bg = c.bg_dark },
		FloatBorder = { fg = c.bg_highlight, bg = c.bg_dark },
		FloatTitle = { fg = c.blue, bg = c.bg_dark },

		MatchParen = { fg = c.yellow, bg = c.bg_highlight, bold = true },

		Pmenu = { fg = c.fg, bg = c.bg_dark },
		PmenuSel = { bg = c.selection },
		PmenuSbar = { bg = c.bg_highlight },
		PmenuThumb = { bg = c.comment },

		Comment = { fg = c.comment, italic = true },
		Constant = { fg = c.cyan },
		String = { fg = c.green },
		Character = { fg = c.green },
		Number = { fg = c.yellow },
		Float = { fg = c.yellow },
		Boolean = { fg = c.yellow },
		Identifier = { fg = c.blue },
		Function = { fg = c.blue },
		Statement = { fg = c.purple },
		Keyword = { fg = c.purple },
		Operator = { fg = c.fg },
		Type = { fg = c.yellow },
		Special = { fg = c.cyan },
		Todo = { fg = c.bg, bg = c.yellow, bold = true },

		DiagnosticError = { fg = c.red },
		DiagnosticWarn = { fg = c.yellow },
		DiagnosticInfo = { fg = c.blue },
		DiagnosticHint = { fg = c.cyan },

		DiagnosticVirtualTextError = { fg = c.red, bg = c.bg_dark },
		DiagnosticVirtualTextWarn = { fg = c.yellow, bg = c.bg_dark },
		DiagnosticVirtualTextInfo = { fg = c.blue, bg = c.bg_dark },
		DiagnosticVirtualTextHint = { fg = c.cyan, bg = c.bg_dark },
		DiagnosticUnderlineError = { undercurl = true, sp = c.red },
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow },
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue },
		DiagnosticUnderlineHint = { undercurl = true, sp = c.cyan },

		TelescopeBorder = { fg = c.bg_highlight, bg = c.bg_dark },
		TelescopeNormal = { fg = c.fg, bg = c.bg_dark },
		TelescopePromptBorder = { fg = c.blue, bg = c.bg_dark },
		TelescopePromptNormal = { fg = c.fg, bg = c.bg_dark },
		TelescopePromptPrefix = { fg = c.blue },
		TelescopeResultsBorder = { fg = c.bg_highlight, bg = c.bg_dark },
		TelescopeResultsNormal = { fg = c.fg, bg = c.bg_dark },
		TelescopePreviewBorder = { fg = c.bg_highlight, bg = c.bg_dark },
		TelescopePreviewNormal = { fg = c.fg, bg = c.bg_dark },
		TelescopeSelection = { fg = c.fg, bg = c.selection },
		TelescopeMatching = { fg = c.yellow, bold = true },

		GitSignsAdd = { fg = c.green, bg = c.bg },
		GitSignsChange = { fg = c.yellow, bg = c.bg },
		GitSignsDelete = { fg = c.red, bg = c.bg },

		StatusLineNormal = { fg = c.bg, bg = c.blue },
		StatusLineInsert = { fg = c.bg, bg = c.green },
		StatusLineVisual = { fg = c.bg, bg = c.purple },
		StatusLineReplace = { fg = c.bg, bg = c.red },
		StatusLineCommand = { fg = c.bg, bg = c.yellow },

		["@comment"] = { link = "Comment" },
		["@string"] = { link = "String" },
		["@number"] = { link = "Number" },
		["@boolean"] = { link = "Boolean" },
		["@function"] = { link = "Function" },
		["@function.builtin"] = { fg = c.cyan },
		["@keyword"] = { link = "Keyword" },
		["@variable"] = { fg = c.fg },
		["@variable.builtin"] = { fg = c.red },
		["@type"] = { link = "Type" },
		["@property"] = { fg = c.fg },
		["@punctuation"] = { fg = c.fg },
		["@tag"] = { fg = c.red },
		["@tag.attribute"] = { fg = c.yellow },
	}
end

return M
