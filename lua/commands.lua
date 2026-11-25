local command = vim.api.nvim_create_user_command

command("LspStatus", function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })

	if #clients == 0 then
		vim.notify("No LSP client attached to the current buffer", vim.log.levels.INFO)
		return
	end

	for _, client in ipairs(clients) do
		print(client.name)
	end
end, {
	desc = "Show active LSP clients",
})

local zoom_tab = nil

command("Zoom", function()
	local curr_tab = vim.api.nvim_get_current_tabpage()

	if zoom_tab and vim.api.nvim_tabpage_is_valid(zoom_tab) then
		if curr_tab == zoom_tab then
			vim.cmd("tabclose")
			zoom_tab = nil
		else
			vim.api.nvim_set_current_tabpage(zoom_tab)
		end
	else
		vim.cmd("tab split")
		zoom_tab = vim.api.nvim_get_current_tabpage()
	end
end, {
	desc = "Toggle zoom window while keeping bufferline visible",
})

-- Clean unused plugins
command("PackClean", function()
	local inactive = vim.iter(vim.pack.get())
		:filter(function(plugin)
			return not plugin.active
		end)
		:map(function(plugin)
			return plugin.spec.name
		end)
		:totable()

	if #inactive == 0 then
		return
	end

	vim.pack.del(inactive)
end, { desc = "Remove inactive plugins" })

-- Replace visual selection throughout the current file.
command("ReplaceSelection", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local mode = vim.fn.mode()

	-- Ensure Visual mode is active.
	if not ({ v = true, V = true, ["\22"] = true })[mode] then
		vim.notify("Select text in Visual mode first", vim.log.levels.WARN)
		return
	end

	local selected = table.concat(vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = mode }), "\n")

	if selected == "" then
		return
	elseif selected:find("\n", 1, true) then
		vim.notify("Select text within a single line", vim.log.levels.WARN)
		return
	end

	vim.ui.input({ prompt = "Replace with: " }, function(replacement)
		if replacement == nil or not vim.api.nvim_buf_is_valid(bufnr) then
			return
		end

		vim.api.nvim_buf_call(bufnr, function()
			vim.cmd(
				"%s/\\C\\V" .. vim.fn.escape(selected, [[\/]]) .. "/" .. vim.fn.escape(replacement, [[\/&~|]]) .. "/g"
			)
		end)
	end)
end, {
	desc = "Replace selection throughout the current file",
})
