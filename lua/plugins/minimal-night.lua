return {
	name = "minimal-night",
	dir = vim.fn.stdpath("config"),
	priority = 1000,
	lazy = false,
	config = function()
		vim.cmd.colorscheme("minimal-night")
	end,
}
