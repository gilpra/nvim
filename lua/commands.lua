local command = vim.api.nvim_create_user_command

command("LspStatus", function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })

	if #clients == 0 then
		vim.notify(
			"No LSP client attached to the current buffer",
			vim.log.levels.INFO
		)
		return
	end

	for _, client in ipairs(clients) do
		print(client.name)
	end
end, {
	desc = "Show active LSP clients",
})

-- Zoom (floating window)
local zoom_win = nil
local zoom_buf = nil
local zoom_src_win = nil
local zoom_closing_via_toggle = false

local WIN_OPTS_TO_COPY = {
	"number",
	"relativenumber",
	"cursorline",
	"signcolumn",
	"foldcolumn",
	"list",
	"colorcolumn",
	"wrap",
	"linebreak",
}

local function copy_win_opts(src_win, dst_win)
	for _, opt in ipairs(WIN_OPTS_TO_COPY) do
		vim.wo[dst_win][opt] = vim.wo[src_win][opt]
	end
end

local function toggle_zoom()
	if zoom_win and vim.api.nvim_win_is_valid(zoom_win) then
		zoom_closing_via_toggle = true
		vim.api.nvim_win_close(zoom_win, true)
		zoom_closing_via_toggle = false
		zoom_win = nil
		zoom_buf = nil
		zoom_src_win = nil
		return
	end

	local src_win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_get_current_buf()
	local was_terminal_insert = vim.bo[buf].buftype == "terminal" and vim.fn.mode() == "t"

	zoom_src_win = src_win
	zoom_buf = buf

	zoom_win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = vim.o.columns,
		height = vim.o.lines - vim.o.cmdheight - 1,
		row = 0,
		col = 0,
		style = "minimal",
		border = "none",
	})

	copy_win_opts(src_win, zoom_win)

	if was_terminal_insert then
		vim.cmd("startinsert")
	end
end

vim.api.nvim_create_autocmd("WinClosed", {
	callback = function(args)
		local closed_win = tonumber(args.match)
		if closed_win ~= zoom_win then
			return
		end

		zoom_win = nil

		if not zoom_closing_via_toggle then
			local buf_to_close = zoom_buf
			local src_win_to_close = zoom_src_win

			if src_win_to_close and vim.api.nvim_win_is_valid(src_win_to_close) then
				vim.api.nvim_win_close(src_win_to_close, true)
			end

			if buf_to_close and vim.api.nvim_buf_is_valid(buf_to_close) then
				pcall(vim.api.nvim_buf_delete, buf_to_close, { force = true })
			end

			if buf_to_close == terminal_buf then
				terminal_buf = nil
				terminal_win = nil
			end
		end

		zoom_buf = nil
		zoom_src_win = nil
	end,
})

vim.api.nvim_create_user_command("Zoom", toggle_zoom, {
	desc = "Toggle window zoom",
})
