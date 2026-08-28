local M = {}

M.packages = {
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

function M.install_all()
	local registry = require("mason-registry")

	for _, name in ipairs(M.packages) do
		local package = registry.get_package(name)

		if not package:is_installed() then
			package:install()
		end
	end
end

return M
