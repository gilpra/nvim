return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.setup()
		ts.install({
			"bash",
			"c",
			"cpp",
			"css",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"python",
			"query",
			"regex",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
		})
	end,
}
