local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- Start Treesitter only for normal file buffers.
autocmd("FileType", {
	group = augroup,
	pattern = require("configs.ts-lang"),
	callback = function(args)
		if vim.bo[args.buf].buftype == "" then
			pcall(vim.treesitter.start, args.buf)
		end
	end,
})

-- Highlight yanked text.
autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 150,
		})
	end,
})

-- Close special buffers with q.
autocmd("FileType", {
	group = augroup,
	pattern = {
		"help",
		"checkhealth",
		"query",
		"qf",
		"lspinfo",
		"runner",
	},
	callback = function(args)
		vim.keymap.set("n", "q", "<cmd>close<cr>", {
			buffer = args.buf,
			silent = true,
		})
	end,
})

-- Leave Terminal mode when the terminal process exits.
autocmd("TermClose", {
	group = augroup,
	callback = function(args)
		vim.schedule(function()
			if vim.api.nvim_buf_is_valid(args.buf) and vim.api.nvim_get_current_buf() == args.buf then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, false, true), "n", false)
			end
		end)
	end,
})

-- Disable automatic comment continuation.
autocmd("FileType", {
	group = augroup,
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Disable completion in specific filetype
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("UserMiniCompletionDisable", { clear = true }),
	pattern = { "markdown", "text", "gitcommit", "oil" },
	callback = function(args)
		vim.b[args.buf].minicompletion_disable = true
	end,
})

-- LSP completion is enabled when the server attaches.
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserMiniCompletion", { clear = true }),
	callback = function(args)
		vim.bo[args.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
	end,
})

-- Reload buffers
vim.api.nvim_create_autocmd("User", {
	pattern = { "NeogitBranchCheckout" },
	callback = function()
		vim.schedule(function()
			vim.cmd("checktime")
		end)
	end,
})
