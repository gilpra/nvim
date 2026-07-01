local M = {}

local tasks = {
	c = {
		compile = ":!gcc % -o %:r",
		run = "./%:r",
	},

	python = {
		run = "python %",
	},

	sh = {
		run = "bash %",
	},

	html = {
		run = "xdg-open %",
	},
}

local function expand_command(cmd)
	local file = vim.fn.expand("%:t")
	local file_root = vim.fn.expand("%:t:r")

	return cmd
		:gsub("%%:r", vim.fn.shellescape(file_root))
		:gsub("%%", vim.fn.shellescape(file))
end

local function open_terminal(cmd)
	local cwd = vim.fn.expand("%:p:h")

	vim.cmd("botright split")
	vim.cmd("resize 10")
	vim.cmd("enew")

	vim.fn.jobstart(
		{ vim.o.shell, "-c", cmd },
		{
			term = true,
			cwd = cwd,
		}
	)

	vim.cmd("startinsert")
end

local function run_task(kind)
	local filetype = vim.bo.filetype
	local task = tasks[filetype]
	local cmd = task and task[kind]

	if not cmd then
		vim.notify(
			"No " .. kind .. " configured for filetype: " .. filetype,
			vim.log.levels.WARN
		)
		return
	end

	if kind == "compile" then
		vim.api.nvim_feedkeys(cmd, "n", false)
		return
	end

	open_terminal(expand_command(cmd))
end

M.compile = function()
	run_task("compile")
end

M.run = function()
	run_task("run")
end

vim.keymap.set("n", "<leader>c", M.compile, {
	desc = "Compile file",
})

vim.keymap.set("n", "<leader>r", M.run, {
	desc = "Run file",
})

return M
