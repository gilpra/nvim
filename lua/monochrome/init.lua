local M = {}

function M.setup(opts)
	opts = opts or {}

	local palette = require("monochrome.palette").get()
	local groups = require("monochrome.groups").get(palette)

	vim.cmd("highlight clear")

	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "monochrome"

	for name, value in pairs(groups) do
		vim.api.nvim_set_hl(0, name, value)
	end
end

function M.load()
	M.setup()
end

return M
