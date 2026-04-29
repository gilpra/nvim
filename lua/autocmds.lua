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

autocmd("FileType", {
	pattern = {
		"html",
		"xml",
		"javascriptreact",
		"typescriptreact",
	},
	callback = function()
		local ok, autotag = pcall(require, "nvim-ts-autotag")
		if ok then
			autotag.setup()
		end
	end,
})

autocmd("FileType", {
	pattern = "*",
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

local create_cmd = vim.api.nvim_create_user_command

create_cmd("TSInstallAll", function()
	local spec = require("lazy.core.config").plugins["nvim-treesitter"]
	local opts = type(spec.opts) == "table" and spec.opts or {}
	require("nvim-treesitter").install(opts.ensure_installed)
end, {})
