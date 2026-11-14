require("swapson").setup({
	npm = {
		enabled = true,
		tool = "bun",
	},
	pip = {
		enabled = true,
		tool = "uv",
	},
})
