local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
	callback = function(data)
		if vim.fn.isdirectory(data.file) == 1 then
			vim.cmd.cd(data.file)
			require("oil").open()
		end
	end,
})

autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt.shiftwidth = 4
		vim.opt.tabstop = 4
	end,
})
