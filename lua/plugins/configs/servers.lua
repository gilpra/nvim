local lsp = require("plugins.configs.lspconfig")
lsp.defaults()

local servers = {
	lua_ls = {},
}

for name, opts in pairs(servers) do
	vim.lsp.config(name, opts)
	vim.lsp.enable(name)
end

-- Export server names untuk mason.lua
return servers
