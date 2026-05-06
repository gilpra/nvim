local M = {}

M.setup = function()
	require("mason").setup()
	require("mason-lspconfig").setup()
	require("mason-tool-installer").setup({
		auto_update = false,
		run_on_start = false,
	})
end

return M
