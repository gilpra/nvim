local M = {}

M.parsers = {
	"c",
	"lua",
	"vim",
	"vimdoc",
	"query",
	"markdown",
	"markdown_inline",
	"bash",
	"regex",
	"html",
	"css",
	"javascript",
	"typescript",
	"tsx",
	"python",
}

M.opts = {
	auto_install = false,
	ensure_installed = {},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
	},

	autotag = {
		enable = true,
	},
}

return M
