require("tree-sitter-manager").setup({
	parser_dir = vim.fn.stdpath("data") .. "/site/parser",
	query_dir = vim.fn.stdpath("data") .. "/site/queries",
	assume_installed = {
		"c",
		"lua",
		"markdown",
		"markdown_inline",
		"query",
		"vim",
		"vimdoc",
	},
	ensure_installed = require("configs.ts-lang"),
	auto_install = false,
	highlight = {},
})
