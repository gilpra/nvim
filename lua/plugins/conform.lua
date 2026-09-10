require("conform").setup({
	formatters_by_ft = {
        require("configs.formatter")
	},
	format_on_save = false,
	notify_on_error = true,
})

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})
end, { desc = "Format buffer" })
