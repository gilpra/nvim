local tasks = {
	c = {
		compile = ":!gcc % -o %:r",
		run = "./%:r",
	},
	python = { run = "python %" },
	sh = { run = "bash %" },
	html = { run = "xdg-open %" },
}

local function expand_command(cmd)
	local file = vim.fn.shellescape(vim.fn.expand("%:t"))
	local root = vim.fn.shellescape(vim.fn.expand("%:t:r"))

	return cmd:gsub("%%:r", root):gsub("%%", file)
end

local function open_terminal(cmd)
	vim.cmd("botright split")
	vim.cmd("resize 10")
	vim.cmd("enew")

	vim.fn.jobstart({ vim.o.shell, "-c", cmd }, {
		term = true,
		cwd = vim.fn.expand("%:p:h"),
	})

	vim.cmd("startinsert")
end

local function task(kind)
	local ft = vim.bo.filetype
	local cmd = tasks[ft] and tasks[ft][kind]

	if not cmd then
		vim.notify(
			("No %s configured for filetype: %s"):format(kind, ft),
			vim.log.levels.WARN
		)
		return
	end

	if kind == "compile" then
		vim.api.nvim_feedkeys(cmd, "n", false)
	else
		open_terminal(expand_command(cmd))
	end
end

vim.keymap.set("n", "<leader>c", function()
	task("compile")
end, { desc = "Compile file" })

vim.keymap.set("n", "<leader>r", function()
	task("run")
end, { desc = "Run file" })
