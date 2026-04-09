-- Ambil server names otomatis dari servers.lua
local server_names = vim.tbl_keys(require("plugins.configs.servers"))

-- Ambil formatter names otomatis dari conform.lua
-- tbl_values menghasilkan list of lists, lalu flatten jadi satu list unik
local formatter_names = {}
local seen = {}
for _, tools in pairs(require("plugins.configs.conform").formatters_by_ft) do
	for _, tool in ipairs(tools) do
		if not seen[tool] then
			seen[tool] = true
			table.insert(formatter_names, tool)
		end
	end
end

require("mason-lspconfig").setup({
	ensure_installed = server_names,
	automatic_installation = true,
})

require("mason-tool-installer").setup({
	ensure_installed = formatter_names,
	auto_update = false,
	run_on_start = true,
})
