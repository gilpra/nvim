local function render()
	local items = {}
	local current = vim.api.nvim_get_current_buf()

	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[bufnr].buflisted then
			local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
			name = name ~= "" and name or "[No Name]"

			local highlight = bufnr == current and "%#TabLineSel#" or "%#TabLine#"

			table.insert(items, highlight .. "%" .. bufnr .. "@v:lua.TablineClick@ " .. name .. " %T")
		end
	end

	return table.concat(items, "%#TabLineFill#│") .. "%#TabLineFill#"
end

-- Handle mouse clicks.
_G.TablineClick = function(bufnr, _, button)
	if button == "l" and vim.api.nvim_buf_is_valid(bufnr) then
		vim.api.nvim_set_current_buf(bufnr)
	end
end

_G.TablineRender = render

vim.opt.showtabline = 2
vim.o.tabline = "%!v:lua.TablineRender()"
