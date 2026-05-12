local M = {}

function M.setup(opts)
	opts = opts or {}

	local palette = require("minimal-night.palette").get()
	local groups = require("minimal-night.groups").get(palette)

	vim.cmd("hi clear")
	vim.g.colors_name = "minimal-night"

	for name, value in pairs(groups) do
		vim.api.nvim_set_hl(0, name, value)
	end
end

function M.load()
	M.setup()
end

return M
