require("conform").setup({
	formatters_by_ft = require("configs.formatter"),
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
})
