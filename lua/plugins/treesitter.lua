return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	event = { "VeryLazy" },
	opts = {
		ensure_installed = {
			"bash",
			"regex",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"python",
		},
	},
}
