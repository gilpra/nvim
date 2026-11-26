require("tree-sitter-manager").setup({
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
	highlight = {},
})
