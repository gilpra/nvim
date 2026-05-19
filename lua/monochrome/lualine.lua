local M = {}

function M.get()
	local c = require("monochrome.palette").get()

	return {
		normal = {
			a = {
				bg = c.white,
				fg = c.bg,
				gui = "bold",
			},
			b = {
				bg = c.bg_highlight,
				fg = c.white,
			},
			c = {
				bg = c.bg_dark,
				fg = c.fg,
			},
		},

		insert = {
			a = {
				bg = c.light,
				fg = c.bg,
				gui = "bold",
			},
			b = {
				bg = c.bg_highlight,
				fg = c.light,
			},
			c = {
				bg = c.bg_dark,
				fg = c.fg,
			},
		},

		visual = {
			a = {
				bg = c.muted,
				fg = c.bg,
				gui = "bold",
			},
			b = {
				bg = c.bg_highlight,
				fg = c.muted,
			},
			c = {
				bg = c.bg_dark,
				fg = c.fg,
			},
		},

		replace = {
			a = {
				bg = c.dim,
				fg = c.bg,
				gui = "bold",
			},
			b = {
				bg = c.bg_highlight,
				fg = c.dim,
			},
			c = {
				bg = c.bg_dark,
				fg = c.fg,
			},
		},

		command = {
			a = {
				bg = c.comment,
				fg = c.bg,
				gui = "bold",
			},
			b = {
				bg = c.bg_highlight,
				fg = c.comment,
			},
			c = {
				bg = c.bg_dark,
				fg = c.fg,
			},
		},

		inactive = {
			a = {
				bg = c.bg_dark,
				fg = c.comment,
			},
			b = {
				bg = c.bg_dark,
				fg = c.comment,
			},
			c = {
				bg = c.bg_dark,
				fg = c.comment,
			},
		},
	}
end

return M
