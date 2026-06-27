function Runner()
	local filetype = vim.bo.filetype
	local cmd

	if filetype == "c" then
		cmd = "./%:r"
	elseif filetype == "python" then
		cmd = "python %"
	elseif filetype == "sh" then
		cmd = "bash %"
	end

	if cmd ~= nil then
		vim.cmd("!" .. cmd)
	else
		vim.notify("No runner configured for filetype: " .. filetype, vim.log.levels.WARN)
	end
end

vim.keymap.set("n", "<leader>r", Runner, { desc = "Run file" })
