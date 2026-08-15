local mason_packages = {
	-- LSP
	"lua-language-server",
	"json-lsp",
	"bash-language-server",
	"html-lsp",
	"emmet-ls",
	"css-lsp",
	"typescript-language-server",
	"pyright",

	-- Formatters
	"stylua",
	"black",
	"shfmt",
	"prettier",
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

	config = function()
		require("mason").setup({
			-- System binaries have priority over Mason binaries.
			PATH = "append",
		})

		vim.api.nvim_create_user_command("MasonInstallAll", function()
			local registry = require("mason-registry")

			for _, name in ipairs(mason_packages) do
				local package = registry.get_package(name)

				if not package:is_installed() then
					package:install()
				end
			end
		end, {})
	end,
}
