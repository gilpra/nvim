return {
	name = "monochrome",
	dir = vim.fn.stdpath("config"),
	priority = 1000,
	lazy = false,
	config = function()
		vim.cmd.colorscheme("monochrome")
	end,
}
