local M = {
	-- Runner window settings
	position = "bot",
	height = 12,

	-- Commands for interpreted languages.
	run = {
		python = { "python" },
		lua = { "lua" },
		javascript = { "node" },
		sh = { "bash" },
		bash = { "bash" },
	},

	-- Commands for compiled languages.
	compile = {
		c = "gcc % -o %:r",
	},
}

local state = {
	win = nil, -- runner window handle
	buf = nil, -- runner buffer handle
	job = nil, -- currently running job id
}

-- Save the current file before running or compiling.
local function save_current_file()
	if vim.bo.modified then
		vim.cmd.write()
	end
end

-- Notify that no run/compile command is configured for a filetype.
local function notify_no_command(kind, filetype)
	vim.notify(("No %s command for: %s"):format(kind, filetype), vim.log.levels.WARN)
end

-- Create a fresh scratch buffer for the terminal, discarding any old one.
local function create_scratch_buffer()
	if state.buf and vim.api.nvim_buf_is_valid(state.buf) then
		vim.api.nvim_buf_delete(state.buf, { force = true })
	end

	state.buf = vim.api.nvim_create_buf(false, true)

	vim.bo[state.buf].buflisted = false
	vim.bo[state.buf].swapfile = false

	return state.buf
end

-- Create the runner window if needed, then attach a fresh buffer to it
local function open_runner_window()
	if not state.win or not vim.api.nvim_win_is_valid(state.win) then
		vim.cmd(("%s %dsplit"):format(M.position, M.height))
		state.win = vim.api.nvim_get_current_win()
	end

	create_scratch_buffer()

	vim.api.nvim_win_set_buf(state.win, state.buf)
	vim.api.nvim_set_current_win(state.win)

	return state.buf
end

-- Build the command used to run the current file:
--  interpreted languages -> interpreter + file path
--  compiled languages    -> the already-compiled binary (no extension)
local function build_run_command()
	local filetype = vim.bo.filetype
	local file = vim.fn.expand("%:p")

	if M.run[filetype] then
		return vim.list_extend(vim.deepcopy(M.run[filetype]), { file })
	end

	if M.compile[filetype] then
		return { vim.fn.expand("%:p:r") }
	end
end

-- Feed the compile command into the command line
local function compile_file()
	save_current_file()

	local cmd = M.compile[vim.bo.filetype]

	if not cmd then
		return notify_no_command("compile", vim.bo.filetype)
	end

	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":!" .. cmd, true, false, true), "n", false)
end

-- Run the current file inside a real interactive terminal.
local function run_file()
	save_current_file()

	local cmd = build_run_command()

	if not cmd then
		return notify_no_command("run", vim.bo.filetype)
	end

	-- Stop the previous process if it is still running.
	if state.job then
		vim.fn.jobstop(state.job)
		state.job = nil
	end

	open_runner_window()

	state.job = vim.fn.jobstart(cmd, {
		term = true,

		on_exit = function()
			state.job = nil
		end,
	})

	-- Give focus to the terminal.
	vim.cmd.startinsert()
end

vim.keymap.set("n", "<leader>r", run_file, { desc = "Run file" })
vim.keymap.set("n", "<leader>c", compile_file, { desc = "Compile file" })
