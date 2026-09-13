local M = {}

M.get = function(c)
	return {
		------------------------------------------------------------------
		-- UI
		------------------------------------------------------------------

		Normal = { fg = c.fg, bg = c.bg },
		NormalNC = { fg = c.fg, bg = c.bg },

		CursorLine = { bg = c.bg_highlight },
		CursorColumn = { bg = c.bg_highlight },

		LineNr = { fg = c.comment },
		CursorLineNr = { fg = c.white, bold = true },

		Visual = { bg = c.selection },
		VisualNOS = { bg = c.selection },

		SignColumn = { fg = c.comment, bg = c.bg },

		WinSeparator = { fg = c.bg_highlight, bg = c.bg },

		Folded = { fg = c.comment, bg = c.bg_highlight },
		FoldColumn = { fg = c.comment, bg = c.bg },

		Search = { fg = c.bg, bg = c.yellow, bold = true },
		IncSearch = { fg = c.bg, bg = c.white, bold = true },
		CurSearch = { fg = c.bg, bg = c.white, bold = true },

		Cursor = { fg = c.bg, bg = c.fg },
		CursorIM = { fg = c.bg, bg = c.fg },

		StatusLine = { fg = c.fg, bg = c.bg_dark },
		StatusLineNC = { fg = c.comment, bg = c.bg_dark },

		TabLine = {
			fg = c.muted,
			bg = c.bg,
		},

		TabLineSel = {
			fg = c.white,
			bg = c.bg,
			bold = true,
		},

		TabLineFill = {
			bg = c.bg,
		},

		NormalFloat = { fg = c.fg, bg = c.bg_dark },
		FloatBorder = { fg = c.bg_highlight, bg = c.bg_dark },
		FloatTitle = { fg = c.white, bg = c.bg_dark, bold = true },

		MatchParen = {
			fg = c.white,
			bg = c.bg_highlight,
			bold = true,
		},

		Pmenu = { fg = c.fg, bg = c.bg_dark },
		PmenuSel = { fg = c.bg, bg = c.blue },
		PmenuSbar = { bg = c.bg_highlight },
		PmenuThumb = { bg = c.comment },

		------------------------------------------------------------------
		-- Syntax (Elflord-inspired)
		------------------------------------------------------------------

		Comment = {
			fg = c.syntax_comment,
			italic = true,
		},

		Constant = {
			fg = c.syntax_constant,
		},

		String = {
			fg = c.syntax_constant,
		},

		Character = {
			fg = c.syntax_constant,
		},

		Number = {
			fg = c.syntax_constant,
		},

		Float = {
			fg = c.syntax_constant,
		},

		Boolean = {
			fg = c.syntax_constant,
		},

		Identifier = {
			fg = c.syntax_identifier,
		},

		Function = {
			fg = c.syntax_function,
		},

		Statement = {
			fg = c.syntax_statement,
			bold = true,
		},

		Keyword = {
			fg = c.syntax_statement,
			bold = true,
		},

		Conditional = {
			fg = c.syntax_repeat,
		},

		Repeat = {
			fg = c.syntax_repeat,
		},

		Label = {
			fg = c.syntax_statement,
			bold = true,
		},

		Exception = {
			fg = c.syntax_statement,
			bold = true,
		},

		Operator = {
			fg = c.syntax_operator,
		},

		Type = {
			fg = c.syntax_type,
			bold = true,
		},

		StorageClass = {
			fg = c.syntax_type,
			bold = true,
		},

		Structure = {
			fg = c.syntax_type,
			bold = true,
		},

		Typedef = {
			fg = c.syntax_type,
			bold = true,
		},

		PreProc = {
			fg = c.syntax_preproc,
		},

		Include = {
			fg = c.syntax_preproc,
		},

		Define = {
			fg = c.syntax_preproc,
		},

		Macro = {
			fg = c.syntax_preproc,
		},

		Special = {
			fg = c.syntax_special,
		},

		SpecialChar = {
			fg = c.syntax_special,
		},

		Delimiter = {
			fg = c.syntax_special,
		},

		Todo = {
			fg = c.bg,
			bg = c.yellow,
			bold = true,
		},

		Error = {
			fg = c.red,
			bold = true,
		},

		WarningMsg = {
			fg = c.orange,
		},

		------------------------------------------------------------------
		-- Diagnostics
		------------------------------------------------------------------

		DiagnosticError = { fg = c.red },
		DiagnosticWarn = { fg = c.orange },
		DiagnosticInfo = { fg = c.blue },
		DiagnosticHint = { fg = c.cyan },

		DiagnosticVirtualTextError = {
			fg = c.red,
			bg = c.bg_dark,
		},

		DiagnosticVirtualTextWarn = {
			fg = c.orange,
			bg = c.bg_dark,
		},

		DiagnosticVirtualTextInfo = {
			fg = c.blue,
			bg = c.bg_dark,
		},

		DiagnosticVirtualTextHint = {
			fg = c.cyan,
			bg = c.bg_dark,
		},

		DiagnosticUnderlineError = {
			undercurl = true,
			sp = c.red,
		},

		DiagnosticUnderlineWarn = {
			undercurl = true,
			sp = c.orange,
		},

		DiagnosticUnderlineInfo = {
			undercurl = true,
			sp = c.blue,
		},

		DiagnosticUnderlineHint = {
			undercurl = true,
			sp = c.cyan,
		},

		------------------------------------------------------------------
		-- Telescope
		------------------------------------------------------------------

		TelescopeBorder = {
			fg = c.bg_highlight,
			bg = c.bg_dark,
		},

		TelescopeNormal = {
			fg = c.fg,
			bg = c.bg_dark,
		},

		TelescopePromptBorder = {
			fg = c.blue,
			bg = c.bg_dark,
		},

		TelescopePromptNormal = {
			fg = c.fg,
			bg = c.bg_dark,
		},

		TelescopePromptPrefix = {
			fg = c.blue,
		},

		TelescopeResultsBorder = {
			fg = c.bg_highlight,
			bg = c.bg_dark,
		},

		TelescopeResultsNormal = {
			fg = c.fg,
			bg = c.bg_dark,
		},

		TelescopePreviewBorder = {
			fg = c.bg_highlight,
			bg = c.bg_dark,
		},

		TelescopePreviewNormal = {
			fg = c.fg,
			bg = c.bg_dark,
		},

		TelescopeSelection = {
			fg = c.fg,
			bg = c.selection,
		},

		TelescopeMatching = {
			fg = c.blue,
			bold = true,
		},

		------------------------------------------------------------------
		-- Git
		------------------------------------------------------------------

		GitSignsAdd = {
			fg = c.green,
			bg = c.bg,
		},

		GitSignsChange = {
			fg = c.yellow,
			bg = c.bg,
		},

		GitSignsDelete = {
			fg = c.red,
			bg = c.bg,
		},

		------------------------------------------------------------------
		-- Statusline
		------------------------------------------------------------------

		StatusLineNormal = {
			fg = c.bg,
			bg = c.white,
			bold = true,
		},

		StatusLineInsert = {
			fg = c.bg,
			bg = c.light,
			bold = true,
		},

		StatusLineVisual = {
			fg = c.bg,
			bg = c.muted,
			bold = true,
		},

		StatusLineReplace = {
			fg = c.bg,
			bg = c.dim,
			bold = true,
		},

		StatusLineCommand = {
			fg = c.bg,
			bg = c.comment,
			bold = true,
		},

		------------------------------------------------------------------
		-- Treesitter
		------------------------------------------------------------------

		["@comment"] = { link = "Comment" },
		["@string"] = { link = "String" },
		["@number"] = { link = "Number" },
		["@boolean"] = { link = "Boolean" },
		["@function"] = { link = "Function" },
		["@keyword"] = { link = "Keyword" },
		["@variable"] = { link = "Identifier" },
		["@type"] = { link = "Type" },
		["@property"] = { link = "Identifier" },
		["@operator"] = { link = "Operator" },
		["@punctuation"] = { link = "Delimiter" },
		["@tag"] = { link = "Special" },

		------------------------------------------------------------------
		-- Markdown
		------------------------------------------------------------------

		["@markup.strong"] = {
			fg = c.white,
			bold = true,
		},

		["@markup.italic"] = {
			fg = c.light,
			italic = true,
		},

		["@markup.strong.markdown_inline"] = {
			fg = c.white,
			bold = true,
		},

		["@markup.italic.markdown_inline"] = {
			fg = c.light,
			italic = true,
		},

		["@markup.raw.markdown_inline"] = {
			fg = c.teal,
			bg = c.bg_dark,
		},

		["@markup.heading.1.markdown"] = {
			fg = c.red,
			bold = true,
		},

		["@markup.heading.2.markdown"] = {
			fg = c.orange,
			bold = true,
		},

		["@markup.heading.3.markdown"] = {
			fg = c.green,
			bold = true,
		},

		["@markup.heading.4.markdown"] = {
			fg = c.cyan,
			bold = true,
		},

		["@markup.heading.5.markdown"] = {
			fg = c.blue,
			bold = true,
		},

		["@markup.heading.6.markdown"] = {
			fg = c.purple,
			bold = true,
		},

		["@markup.heading.marker.markdown"] = {
			fg = c.comment,
		},
	}
end

return M
