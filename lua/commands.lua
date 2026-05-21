local command = vim.api.nvim_create_user_command

command("MasonInstallAll", function()
	local lsp_map = require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package

	local registry = require("mason-registry")

	local tools = {}

	-- LSP
	for name in pairs(require("configs.servers")) do
		local pkg = lsp_map[name]

		if pkg then
			tools[#tools + 1] = pkg
		end
	end

	-- Formatter dari conform
	local ok, conform = pcall(require, "plugins.conform")

	if ok and conform.opts and conform.opts.formatters_by_ft then
		for _, ft_tools in pairs(conform.opts.formatters_by_ft) do
			if type(ft_tools) == "table" then
				for _, tool in ipairs(ft_tools) do
					if type(tool) == "string" then
						tools[#tools + 1] = tool
					end
				end
			end
		end
	end

	local to_install = vim.tbl_filter(function(pkg)
		local ok_pkg, p = pcall(function()
			return registry.get_package(pkg)
		end)

		return ok_pkg and p and not p:is_installed()
	end, tools)

	if #to_install > 0 then
		vim.cmd("MasonInstall " .. table.concat(to_install, " "))
	else
		print("All tools already installed")
	end
end, {})

-- Terminal Toggle
local terminal_buf = nil
local terminal_win = nil

local function toggle_terminal()
	if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
		vim.api.nvim_win_close(terminal_win, true)
		terminal_win = nil
		return
	end

	if not terminal_buf or not vim.api.nvim_buf_is_valid(terminal_buf) then
		terminal_buf = vim.api.nvim_create_buf(false, true)
	end

	vim.cmd("botright split")
	vim.api.nvim_win_set_height(0, 15)
	terminal_win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(terminal_win, terminal_buf)

	vim.wo[terminal_win].winfixheight = true
	vim.wo[terminal_win].winfixwidth = true

	if vim.bo[terminal_buf].buftype ~= "terminal" then
		vim.fn.jobstart({ vim.o.shell }, { term = true })
	end

	vim.cmd("startinsert")
end

vim.api.nvim_create_autocmd("TermClose", {
	callback = function(args)
		if args.buf == terminal_buf then
			if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
				vim.api.nvim_win_close(terminal_win, true)
			end
			terminal_win = nil
			terminal_buf = nil
		end
	end,
})

vim.api.nvim_create_autocmd("WinClosed", {
	callback = function(args)
		if tonumber(args.match) == terminal_win then
			terminal_win = nil
		end
	end,
})

vim.api.nvim_create_user_command("ToggleTerm", toggle_terminal, {
	desc = "Toggle terminal split",
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
