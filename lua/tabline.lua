local M = {}

function M.render()
	local buffers = {}
	local current = vim.api.nvim_get_current_buf()

	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buflisted then
			local name = vim.fn.fnamemodify(
				vim.api.nvim_buf_get_name(bufnr),
				":t"
			)

			if name == "" then
				name = "[No Name]"
			end

			local highlight = bufnr == current
					and "%#TabLineSel#"
				or "%#TabLine#"

			local modified = vim.bo[bufnr].modified and " ●" or ""

			table.insert(
				buffers,
				highlight .. " " .. name .. modified .. " "
			)
		end
	end

	return table.concat(buffers, "%#TabLineFill#│")
end

function M.setup()
	vim.opt.showtabline = 2
	vim.o.tabline = "%!v:lua.require('tabline').render()"
end

return M
