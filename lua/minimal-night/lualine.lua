local M = {}

function M.get()
	local c = require("minimal-night.palette").get()

	return {
		normal = {
			a = { bg = c.blue, fg = c.bg, gui = "bold" },
			b = { bg = c.bg_highlight, fg = c.blue },
			c = { bg = c.bg_dark, fg = c.fg },
		},

		insert = {
			a = { bg = c.green, fg = c.bg, gui = "bold" },
			b = { bg = c.bg_highlight, fg = c.green },
		},

		visual = {
			a = { bg = c.purple, fg = c.bg, gui = "bold" },
			b = { bg = c.bg_highlight, fg = c.purple },
		},

		replace = {
			a = { bg = c.red, fg = c.bg, gui = "bold" },
			b = { bg = c.bg_highlight, fg = c.red },
		},

		command = {
			a = { bg = c.yellow, fg = c.bg, gui = "bold" },
			b = { bg = c.bg_highlight, fg = c.yellow },
		},

		inactive = {
			a = { bg = c.bg_dark, fg = c.comment },
			b = { bg = c.bg_dark, fg = c.comment },
			c = { bg = c.bg_dark, fg = c.comment },
		},
	}
end

return M
