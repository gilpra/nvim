local packages = {
	-- Language servers
	"lua-language-server",
	"json-lsp",
	"bash-language-server",
	"html-lsp",
	"emmet-ls",
	"css-lsp",
	"typescript-language-server",
	"pyright",
	"clangd",

	-- Formatters
	"stylua",
	"black",
	"shfmt",
	"prettier",
	"clang-format",
}

return {
	"williamboman/mason.nvim",

	cmd = {
		"Mason",
		"MasonInstall",
		"MasonInstallAll",
		"MasonUpdate",
		"MasonUninstall",
	},

	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"neovim/nvim-lspconfig",
	},

	config = function()
		require("mason").setup({
			PATH = "prepend",
		})

		vim.api.nvim_create_user_command("MasonInstallAll", function()
			vim.cmd("MasonInstall " .. table.concat(packages, " "))
		end, {
			desc = "Install all configured Mason packages",
		})

		local lsp = require("configs.lspconfig")
		lsp.defaults()

		local servers = require("configs.servers")

		for name, opts in pairs(servers) do
			vim.lsp.config(name, opts)
			vim.lsp.enable(name)
		end
	end,
}
