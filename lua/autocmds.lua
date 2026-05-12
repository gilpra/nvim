local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- Auto start Treesitter
autocmd("FileType", {
	group = augroup,
	callback = function(args)
		if vim.bo[args.buf].buftype == "" then
			pcall(vim.treesitter.start, args.buf)
		end
	end,
})

-- Highlight yank
autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 150,
		})
	end,
})

-- Quick close special buffers
autocmd("FileType", {
	group = augroup,
	pattern = {
		"help",
		"checkhealth",
		"query",
		"qf",
		"lspinfo",
	},
	callback = function(args)
		vim.keymap.set("n", "q", "<cmd>close<cr>", {
			buffer = args.buf,
			silent = true,
		})
	end,
})

-- Wrap for prose
autocmd("FileType", {
	group = augroup,
	pattern = {
		"markdown",
		"text",
	},
	callback = function()
		vim.opt_local.wrap = true
	end,
})

autocmd("FileType", {
	group = augroup,
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})
