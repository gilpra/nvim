-- Ambil server names otomatis dari servers.lua
local server_names = vim.tbl_keys(require("plugins.configs.servers"))

require("mason-lspconfig").setup({
	ensure_installed = server_names,
	automatic_installation = true,
})
