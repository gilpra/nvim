function Compile()
	local filetype = vim.bo.filetype
	local cmd

	if filetype == "c" then
		cmd = ":!gcc % -o %:r"
	end

	if cmd ~= nil then
		vim.api.nvim_feedkeys(cmd, "n", false)
	else
		vim.notify("No compiler configured for filetype: " .. filetype, vim.log.levels.WARN)
	end
end

vim.keymap.set("n", "<leader>c", Compile, { desc = "Run compiler" })
