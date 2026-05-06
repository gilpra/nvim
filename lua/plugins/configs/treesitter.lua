return {
	auto_install = false,

	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",

		-- Parser untuk bahasa yang dipakai
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
	},

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
