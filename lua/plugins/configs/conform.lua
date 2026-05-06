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

	format_on_save = function(bufnr)
		local max_bytes = 100000 -- skip format jika file > ~100KB
		local last_line = vim.api.nvim_buf_line_count(bufnr)
		local size = vim.api.nvim_buf_get_offset(bufnr, last_line)
		if size > max_bytes then
			return
		end
		return {
			timeout_ms = 500,
			lsp_format = "fallback",
		}
	end,

	notify_on_error = true,
}
