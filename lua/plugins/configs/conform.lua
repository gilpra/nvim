return {
	formatters_by_ft = {
		lua = { "stylua" },

		python = { "black" },

		sh = { "shfmt" },
		bash = { "shfmt" },
		zsh = { "shfmt" },

		css = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
	},

	format_on_save = {
		timeout_ms = 1500,
		lsp_format = "fallback",
	},

	notify_on_error = true,
}
