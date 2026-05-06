local M = {}

M.setup = function()
	local servers = require("plugins.configs.servers")
	local server_names = vim.tbl_keys(servers)

	local formatter_names = {}
	local seen = {}
	for _, tools in pairs(require("plugins.configs.conform").formatters_by_ft) do
		for _, tool in ipairs(tools) do
			if type(tool) == "string" and not seen[tool] then
				seen[tool] = true
				table.insert(formatter_names, tool)
			end
		end
	end

	require("mason").setup()

	require("mason-lspconfig").setup({
		ensure_installed = server_names,
		automatic_installation = false,
	})

	require("mason-tool-installer").setup({
		ensure_installed = formatter_names,
		auto_update = false,
		run_on_start = false,
	})
end

return M
