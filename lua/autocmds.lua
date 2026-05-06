local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- Override indentasi untuk Python
autocmd("FileType", {
	group = augroup,
	pattern = "python",
	callback = function()
		vim.opt_local.shiftwidth = 4 -- lebar saat tekan >> atau autoindent
		vim.opt_local.tabstop = 4 -- lebar visual karakter Tab
		vim.opt_local.softtabstop = 4 -- lebar Tab saat insert mode
	end,
})

-- Highlight teks yang baru saja di-yank (copy)
autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
	end,
})
