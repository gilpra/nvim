return {
	"williamboman/mason.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {},
	config = function()
		require("mason").setup()

		-- Setup LSP langsung di sini, tidak perlu plugin tambahan
		local lsp = require("configs.lspconfig")
		lsp.defaults()

		local servers = require("configs.servers")
		for name, opts in pairs(servers) do
			vim.lsp.config(name, opts)
			vim.lsp.enable(name)
		end
	end,
}
