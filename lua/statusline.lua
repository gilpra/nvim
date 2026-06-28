local M = {}

local modes = {
	n = { "NORMAL", "StatusLineNormal" },
	i = { "INSERT", "StatusLineInsert" },
	v = { "VISUAL", "StatusLineVisual" },
	V = { "VISUAL", "StatusLineVisual" },
	["\22"] = { "VISUAL", "StatusLineVisual" },
	R = { "REPLACE", "StatusLineReplace" },
	c = { "COMMAND", "StatusLineCommand" },
	t = { "TERMINAL", "StatusLineCommand" },
}

function M.mode()
	local mode = modes[vim.fn.mode()] or modes.n

	return string.format("%%#%s# %s %%#StatusLine#", mode[2], mode[1])
end

function M.branch()
	local branch = vim.b.gitsigns_head

	if branch and branch ~= "" then
		return " │ " .. branch
	end

	return ""
end

function M.diagnostics()
	local severity = vim.diagnostic.severity
	local result = {}

	local errors = #vim.diagnostic.get(0, {
		severity = severity.ERROR,
	})

	local warnings = #vim.diagnostic.get(0, {
		severity = severity.WARN,
	})

	if errors > 0 then
		table.insert(result, "%#DiagnosticError#E:" .. errors)
	end

	if warnings > 0 then
		table.insert(result, "%#DiagnosticWarn#W:" .. warnings)
	end

	if #result == 0 then
		return ""
	end

	return " │ " .. table.concat(result, " ")
end

function M.statusline()
	if vim.bo.filetype == "oil" then
		return ""
	end

	return table.concat({
		M.mode(),
		M.branch(),
		M.diagnostics(),
		" │ %f%m%r",
		"%=",
		"%{&fileformat}",
		" │ %{&filetype}",
		" │ %l:%c ",
	})
end

function M.setup()
	vim.opt.statusline = "%!v:lua.require('statusline').statusline()"
end

return M
