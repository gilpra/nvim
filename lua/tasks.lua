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

local function run_task(kind)
	local filetype = vim.bo.filetype
	local task = tasks[filetype]
	local cmd = task and task[kind]

	if not cmd then
		vim.notify("No " .. kind .. " configured for filetype: " .. filetype, vim.log.levels.WARN)
		return
	end

	if kind == "compile" then
		vim.api.nvim_feedkeys(cmd, "n", false)
	else
		vim.cmd("!" .. cmd)
	end
end

M.compile = function() run_task("compile") end
M.run = function() run_task("run") end

vim.keymap.set("n", "<leader>c", M.compile, { desc = "Compile file" })
vim.keymap.set("n", "<leader>r", M.run, { desc = "Run file" })

return M
